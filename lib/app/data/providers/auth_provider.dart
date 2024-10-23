import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';

class AuthProvider extends BaseProvider {
  Future<Response> login(var data) async => await post('/login', data);
}
