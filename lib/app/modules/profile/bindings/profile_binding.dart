import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/profile_provider.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ProfileProvider>(
      () => ProfileProvider(),
    );
  }
}
