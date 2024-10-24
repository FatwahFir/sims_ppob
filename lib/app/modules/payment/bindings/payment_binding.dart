import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/payment_provider.dart';

import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<PaymentProvider>(
      () => PaymentProvider(),
    );
  }
}
