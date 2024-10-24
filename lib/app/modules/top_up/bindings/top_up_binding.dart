import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/top_up_provider.dart';

import '../controllers/top_up_controller.dart';

class TopUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopUpController>(
      () => TopUpController(),
    );
    Get.lazyPut<TopUpProvider>(
      () => TopUpProvider(),
    );
  }
}
