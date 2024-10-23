import 'package:get_storage/get_storage.dart';

class Box {
  static final GetStorage _session = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static GetStorage get session => _session;

  static String? get token => _session.read('token');

  static Future<void> setLoginData(Map<String, dynamic> data) async {
    await _session.write('login_data', data);
  }

  static Future<void> setToken(String data) async {
    await _session.write('token', data);
  }
}
