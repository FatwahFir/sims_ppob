import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/auth_provider.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class AuthController extends GetxController {
  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final _provider = Get.find<AuthProvider>();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    try {
      isLoading(true);
      var data = {
        "email": email.text,
        "password": password.text,
      };
      var res = await _provider.login(data);
      if (res.statusCode == HttpStatus.ok) {
        await Box.setToken(res.body['data']['token']);
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }
}
