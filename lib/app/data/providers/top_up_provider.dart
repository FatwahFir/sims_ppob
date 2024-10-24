import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';

class TopUpProvider extends BaseProvider {
  Future<Response> topUp(var data) async => await post("/topup", data);
}
