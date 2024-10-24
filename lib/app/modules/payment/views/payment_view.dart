import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/components/balance_widget.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/shared/components/common_text_field.dart';
import 'package:sims_ppob/app/shared/components/loading_indicator.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.payment),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const LoadingIndicatior()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BalanceWidget(balance: Box.balance ?? 0),
                            const Gap.v(h: 70),
                            Text(
                              MyStrings.payment,
                              style: Get.textTheme.labelLarge,
                            ),
                            const Gap.v(h: 15),
                            Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      controller.service.value.serviceIcon ??
                                          '-',
                                  width: 35,
                                ),
                                const Gap.h(w: 10),
                                Text(
                                  controller.service.value.serviceName ?? '-',
                                  style: Get.textTheme.displaySmall,
                                )
                              ],
                            ),
                            const Gap.v(h: 25),
                            Form(
                              key: controller.formKey,
                              child: CommonTextField(
                                readOnly: true,
                                isAutoValidate: true,
                                controller: controller.amountC,
                                hintText: MyStrings.enterTopUpNominal,
                                prefixIcon: Icons.money,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap.v(h: 20),
                    CommonButton(
                      backgroundColor:
                          (MyUtils.strThousandToInt(controller.amountC.text) ??
                                      0) <
                                  (Box.balance ?? 0)
                              ? Themes.red
                              : Themes.grayColor,
                      child: const Text(
                        MyStrings.pay,
                      ),
                      onPressed: () {
                        if ((MyUtils.strThousandToInt(
                                    controller.amountC.text) ??
                                0) <
                            (Box.balance ?? 0)) {
                          if (controller.formKey.currentState!.validate()) {
                            controller.pay();
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
