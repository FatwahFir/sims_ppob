import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/modules/home/views/home_view.dart';
import 'package:sims_ppob/app/modules/profile/views/profile_view.dart';
import 'package:sims_ppob/app/modules/top_up/views/top_up_view.dart';
import 'package:sims_ppob/app/modules/transaction_history/views/transaction_history_view.dart';

class CoreController extends GetxController {
  RxInt currenIndex = 0.obs;
  List<Widget> pages = [
    const HomeView(),
    const TopUpView(),
    const TransactionHistoryView(),
    const ProfileView(),
  ];
}
