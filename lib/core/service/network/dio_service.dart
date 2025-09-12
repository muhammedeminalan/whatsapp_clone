import 'package:dio/dio.dart';
import 'network_exceptions.dart';

/// DioClient: Tüm HTTP isteklerini yöneten servis
/// Singleton pattern ile çalışır
class DioService {
  static final DioService _instance = DioService._internal();

  late final Dio _dio;

  factory DioService() => _instance;

  DioService._internal() {
    _dio = Dio(
      BaseOptions(
        /// Header bilgileri
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    /// Timeout ayarları
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);

    /// Logging interceptor
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  /// GET isteği
  Future<dynamic> get(
    String url, { // artık full URL
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// POST isteği
  Future<dynamic> post(String url, {dynamic data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// PUT isteği
  Future<dynamic> put(String url, {dynamic data}) async {
    try {
      final response = await _dio.put(url, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// DELETE isteği
  Future<dynamic> delete(String url, {dynamic data}) async {
    try {
      final response = await _dio.delete(url, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Response yönetimi
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.statusMessage ?? "Bad Request");
      case 401:
        throw UnauthorizedException(response.statusMessage ?? "Unauthorized");
      case 404:
        throw NotFoundException(response.statusMessage ?? "Not Found");
      case 500:
      case 502:
      case 503:
        throw InternalServerErrorException(
          response.statusMessage ?? "Server Error",
        );
      default:
        throw UnknownException(response.statusMessage ?? "Unknown Error");
    }
  }

  /// DioException yönetimi
  NetworkException _handleDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return DeadlineExceededException();
    } else if (error.response != null) {
      try {
        return _handleResponse(error.response!);
      } catch (_) {
        return UnknownException(
          error.response?.statusMessage ?? "Unknown Error",
        );
      }
    } else if (error.type == DioExceptionType.cancel) {
      return NetworkException("Request Cancelled");
    } else {
      return UnknownException(error.message ?? "Unknown Error");
    }
  }
}
