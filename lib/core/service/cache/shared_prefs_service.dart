import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static final SharedPrefsService instance = SharedPrefsService._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Bool değer oku
  /// [key] -> okunacak anahtar
  /// [defaultValue] -> key yoksa dönecek varsayılan değer
  bool getBool(String key, {bool defaultValue = false}) =>
      _prefs?.getBool(key) ?? defaultValue;

  /// Bool değer yaz
  /// [key] -> kaydedilecek anahtar
  /// [value] -> kaydedilecek değer
  Future<void> setBool(String key, bool value) async =>
      await _prefs?.setBool(key, value);

  /// String değer oku
  /// [key] -> okunacak anahtar
  /// [defaultValue] -> key yoksa dönecek varsayılan değer
  String getString(String key, {String defaultValue = ''}) =>
      _prefs?.getString(key) ?? defaultValue;

  /// String değer yaz
  /// [key] -> kaydedilecek anahtar
  /// [value] -> kaydedilecek değer
  Future<void> setString(String key, String value) async =>
      await _prefs?.setString(key, value);

  /// Int değer oku
  /// [key] -> okunacak anahtar
  /// [defaultValue] -> key yoksa dönecek varsayılan değer
  int getInt(String key, {int defaultValue = 0}) =>
      _prefs?.getInt(key) ?? defaultValue;

  /// Int değer yaz
  /// [key] -> kaydedilecek anahtar
  /// [value] -> kaydedilecek değer
  Future<void> setInt(String key, int value) async =>
      await _prefs?.setInt(key, value);

  /// Belirli bir key'i sil
  Future<void> remove(String key) async => await _prefs?.remove(key);

  /// Tüm SharedPreferences verilerini temizle
  Future<void> clear() async => await _prefs?.clear();
}
