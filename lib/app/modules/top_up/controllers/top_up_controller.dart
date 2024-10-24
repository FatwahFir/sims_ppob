import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:sims_ppob/app/data/providers/top_up_provider.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class TopUpController extends GetxController {
  final nominalC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<int> nominal = [10000, 20000, 50000, 100000, 250000, 500000];
  RxInt selectedNominalIndex = (-1).obs;
  RxBool isBtnDisabled = true.obs;
  RxBool isLoading = false.obs;

  final _provider = Get.find<TopUpProvider>();

  void formatWithThousandSeparator(String value) {
    if (value.isNotEmpty) {
      try {
        String formatted = MyUtils.strThousandFormat(value);
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
    int? numericValue = MyUtils.strThousandToInt(value);
    if (numericValue == null) {
      return MyStrings.pleaseEnterNominal;
    } else if (numericValue < 10000) {
      return MyStrings.minTopUpNominal;
    } else if (numericValue > 1000000) {
      return MyStrings.maxTopUpNominal;
    }

    return null;
  }

  Future<void> topUp() async {
    try {
      isLoading(true);

      var topUpAmount = nominalC.text.isNotEmpty
          ? MyUtils.strThousandToInt(nominalC.text)
          : (selectedNominalIndex.value != -1
              ? nominal[selectedNominalIndex.value]
              : null);

      if (topUpAmount == null) {
        throw Exception(MyStrings.enterTopUpNominal);
      }

      var data = {
        'top_up_amount': topUpAmount,
      };

      var res = await _provider.topUp(data);

      if (res.statusCode == HttpStatus.ok) {
        CustomSnackBar.success(
          successList: [
            res.body['message'],
          ],
        );
        Get.offAllNamed(Routes.CORE);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }
}
