import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class TopUpController extends GetxController {
  final nominalC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<int> nominal = [10000, 20000, 50000, 100000, 250000, 500000];
  RxInt selectedNominalIndex = (-1).obs;
  RxBool isBtnDisabled = true.obs;

  void formatWithThousandSeparator(String value) {
    String cleaned = value.replaceAll('.', '');

    if (cleaned.isNotEmpty) {
      try {
        int parsedValue = int.parse(cleaned);
        final NumberFormat numberFormat = NumberFormat('#,###', 'en_US');
        String formatted =
            numberFormat.format(parsedValue).replaceAll(',', '.');
        nominalC.value = TextEditingValue(
          text: formatted,
          selection: TextSelection.collapsed(offset: formatted.length),
        );
      } catch (e) {
        MyUtils.exceptionHandler('Error parsing value: $e');
      }
    }
  }

  String? validateInput(String value) {
    int? numericValue = int.tryParse(value.replaceAll('.', ''));
    if (numericValue == null) {
      return MyStrings.pleaseEnterNominal;
    } else if (numericValue < 10000) {
      return MyStrings.minTopUpNominal;
    } else if (numericValue > 1000000) {
      return MyStrings.minTopUpNominal;
    }

    return null;
  }

  int getIntValue(String val) {
    return int.parse(val.replaceAll('.', ''));
  }

  bool isButtonDisable() {
    return selectedNominalIndex.value == -1 ||
        getIntValue(nominalC.text) < 10000 ||
        nominalC.text.isEmpty ||
        nominalC.text.toLowerCase() == 'null';
  }

  @override
  void onClose() {
    super.onClose();
    nominalC.dispose();
  }
}
