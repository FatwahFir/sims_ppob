import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/profile_provider.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class ProfileController extends GetxController {
  final emailC = TextEditingController(text: Box.user?.email ?? '-');
  final firstNameC = TextEditingController(text: Box.user?.firstName ?? '-');
  final lastNameC = TextEditingController(text: Box.user?.lastName ?? '-');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isEditMode = false.obs;
  RxBool isLoading = false.obs;

  final _provider = Get.find<ProfileProvider>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> updateImage(File file) async {
    try {
      isLoading(true);
      String mimeType = file.path.endsWith('.png') ? 'image/png' : 'image/jpeg';
      final form = FormData({
        'file': MultipartFile(
          file,
          filename: file.path.split('/').last,
          contentType: mimeType,
        ),
      });
      log(form.files.first.value.length.toString());
      log(form.files.first.value.filename);
      var res = await _provider.uploadFile(form);
      if (res.statusCode == HttpStatus.ok) {
        await Box.session.remove('user');
        await Box.setUser(res.body['data']);
        CustomSnackBar.success(successList: [res.body['message']]);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }
}