import 'package:get_storage/get_storage.dart';

class Box {
  static final GetStorage _session = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static GetStorage get loginState => _session;

  static String? get attendanceStatus => _session.read('status');

  // static String get role => loginState.read('role');

  // static void setUser(User user) {
  //   _session.write('user', user.toJson());
  // }

  static Future<void> setLoginData(Map<String, dynamic> data) async {
    await _session.write('user', data);
  }
}
