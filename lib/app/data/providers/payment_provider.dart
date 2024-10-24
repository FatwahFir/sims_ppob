import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';

class PaymentProvider extends BaseProvider {
  Future<Response> pay(var data) async => await post("/transaction", data);
}
