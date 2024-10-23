import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';

class RegisterProvider extends BaseProvider {
  Future<Response> register(var data) async =>
      await post('/registration', data);
}
