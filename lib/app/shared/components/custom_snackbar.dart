import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';

import '../../utils/converter.dart';

class CustomSnackBar {
  static error({required List<String> errorList, int duration = 2}) {
    String message = '';
    if (errorList.isEmpty) {
      message = MyStrings.somethingWentWrong.tr;
    } else {
      for (var element in errorList) {
        String tempMessage = element.tr;
        message = message.isEmpty ? tempMessage : "$message\n$tempMessage";
      }
    }
    message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    Get.rawSnackbar(
      icon: Icon(
        Icons.error_rounded,
        color: Themes.red,
      ),
      // progressIndicatorBackgroundColor: Themes.green.withOpacity(0.8),
      // progressIndicatorValueColor:
      //     const AlwaysStoppedAnimation<Color>(Colors.transparent),
      messageText: Text(message,
          style: Get.textTheme.bodyLarge?.copyWith(color: Themes.darkColor)),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Themes.white,
      boxShadows: [
        BoxShadow(
          color: Themes.grayColor.withOpacity(0.7),
          blurRadius: 4,
          spreadRadius: 0.5,
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      duration: Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
      leftBarIndicatorColor: Themes.transparent,
      animationDuration: const Duration(seconds: 2),
      borderColor: Themes.transparent,
      reverseAnimationCurve: Curves.easeOut,
      borderWidth: 2,
    );
  }

  static success({required List<String> successList, int duration = 2}) {
    String message = '';
    if (successList.isEmpty) {
      message = MyStrings.somethingWentWrong.tr;
    } else {
      for (var element in successList) {
        String tempMessage = element.tr;
        message = message.isEmpty ? tempMessage : "$message\n$tempMessage";
      }
    }
    message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    Get.rawSnackbar(
      icon: Icon(
        Icons.check_circle_rounded,
        color: Themes.green,
      ),
      // progressIndicatorBackgroundColor: Themes.green.withOpacity(0.8),
      // progressIndicatorValueColor:
      //     const AlwaysStoppedAnimation<Color>(Colors.transparent),
      messageText: Text(message,
          style: Get.textTheme.bodyLarge?.copyWith(color: Themes.darkColor)),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Themes.white,
      boxShadows: [
        BoxShadow(
          color: Themes.grayColor.withOpacity(0.7),
          blurRadius: 4,
          spreadRadius: 0.5,
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      duration: Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
      leftBarIndicatorColor: Themes.transparent,
      animationDuration: const Duration(seconds: 2),
      borderColor: Themes.transparent,
      reverseAnimationCurve: Curves.easeOut,
      borderWidth: 2,
    );
  }
}
