import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/modules/home/views/home_view.dart';
import 'package:sims_ppob/app/modules/top_up/views/top_up_view.dart';
import 'package:sims_ppob/app/modules/transaction_history/views/transaction_history_view.dart';

class CoreController extends GetxController {
  RxInt currenIndex = 0.obs;
  List<Widget> pages = [
    HomeView(),
    TopUpView(),
    TransactionHistoryView(),
    Container(
      color: Colors.green,
      width: Get.width,
      height: Get.height,
    ),
  ];
}
