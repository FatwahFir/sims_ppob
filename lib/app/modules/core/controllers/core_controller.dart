import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/modules/home/views/home_view.dart';

class CoreController extends GetxController {
  RxInt currenIndex = 0.obs;
  List<Widget> pages = [
    HomeView(),
    Container(
      color: Colors.red,
      width: Get.width,
      height: Get.height,
    ),
    Container(
      color: Colors.blue,
      width: Get.width,
      height: Get.height,
    ),
    Container(
      color: Colors.green,
      width: Get.width,
      height: Get.height,
    ),
  ];
}
