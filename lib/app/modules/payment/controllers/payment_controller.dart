import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sims_ppob/app/data/models/service_model.dart';
import 'package:sims_ppob/app/data/providers/payment_provider.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class PaymentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final amountC = TextEditingController();
  Rx<Service> service = Service().obs;
  RxBool isLoading = false.obs;

  final _provider = Get.find<PaymentProvider>();

  @override
  void onInit() async {
    isLoading(true);
    final NumberFormat numberFormat = NumberFormat('#,###', 'en_US');

    super.onInit();
    service.value = await Get.arguments['item'];
    amountC.value = TextEditingValue(
      text:
          numberFormat.format(service.value.serviceTariff).replaceAll(',', '.'),
    );
    isLoading(false);
  }

  Future<void> pay() async {
    try {
      isLoading(true);
      var data = {
        'service_code': service.value.serviceCode,
      };
      var res = await _provider.pay(data);
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
