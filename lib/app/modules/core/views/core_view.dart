import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.currenIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => controller.currenIndex.value = value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Themes.white,
          selectedItemColor: Themes.dark50,
          unselectedItemColor: Themes.grayColor,
          currentIndex: controller.currenIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: Themes.grayColor,
              ),
              label: MyStrings.home,
              activeIcon: Icon(
                Icons.home_rounded,
                color: Themes.dark50,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: Themes.grayColor,
              ),
              label: MyStrings.topUp,
              activeIcon: Icon(
                Icons.money,
                color: Themes.dark50,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
                color: Themes.grayColor,
              ),
              label: MyStrings.transaction,
              activeIcon: Icon(
                Icons.credit_card,
                color: Themes.dark50,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Themes.grayColor,
              ),
              label: MyStrings.account,
              activeIcon: Icon(
                Icons.person,
                color: Themes.dark50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
