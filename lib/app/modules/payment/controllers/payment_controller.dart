import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sims_ppob/app/data/models/service_model.dart';

class PaymentController extends GetxController {
  final fomKey = GlobalKey<FormState>();
  final amountC = TextEditingController();
  Rx<Service> service = Service().obs;
  RxBool isLoading = false.obs;
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
}
