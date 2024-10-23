import 'package:get_storage/get_storage.dart';
import 'package:sims_ppob/app/data/models/user_model.dart';

class Box {
  static final GetStorage _session = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static GetStorage get session => _session;

  static String? get token => _session.read('token');
  static User? get user => User.fromJson(_session.read('user'));
  static int? get balance => _session.read('balance');

  static Future<void> setLoginData(Map<String, dynamic> data) async {
    await _session.write('login_data', data);
  }

  static Future<void> setToken(String data) async {
    await _session.write('token', data);
  }

  static Future<void> setUser(Map<String, dynamic> data) async {
    await _session.write('user', data);
  }

  static Future<void> setBalance(int data) async {
    await _session.write('balance', data);
  }
}
