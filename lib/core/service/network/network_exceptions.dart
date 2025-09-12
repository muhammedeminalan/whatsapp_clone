// lib/core/network/network_exceptions.dart
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;
}

class BadRequestException extends NetworkException {
  BadRequestException([super.message = "Bad Request"]);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException([super.message = "Unauthorized"]);
}

class NotFoundException extends NetworkException {
  NotFoundException([super.message = "Not Found"]);
}

class InternalServerErrorException extends NetworkException {
  InternalServerErrorException([super.message = "Internal Server Error"]);
}

class DeadlineExceededException extends NetworkException {
  DeadlineExceededException([super.message = "Request Timed Out"]);
}

class UnknownException extends NetworkException {
  UnknownException([super.message = "Unknown Error"]);
}
