import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/utils/box.dart';

class ProfileController extends GetxController {
  final emailC = TextEditingController(text: Box.user?.email ?? '-');
  final firstNameC = TextEditingController(text: Box.user?.firstName ?? '-');
  final lastNameC = TextEditingController(text: Box.user?.lastName ?? '-');

  @override
  void onInit() {
    super.onInit();
  }
}
