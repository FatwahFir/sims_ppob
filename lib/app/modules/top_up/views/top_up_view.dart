import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/components/alert_dialog.dart';
import 'package:sims_ppob/app/shared/components/balance_widget.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/shared/components/common_text_field.dart';
import 'package:sims_ppob/app/shared/components/loading_indicator.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/converter.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

import '../controllers/top_up_controller.dart';

class TopUpView extends GetView<TopUpController> {
  const TopUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyStrings.topUp,
          style: Get.textTheme.displaySmall,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const LoadingIndicatior()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BalanceWidget(balance: Box.balance ?? 0),
                      const Gap.v(h: 50),
                      Text(
                        'Silahkan masukan',
                        style: Get.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      Text(
                        "nominal Top Up",
                        style:
                            Get.textTheme.displayLarge?.copyWith(fontSize: 26),
                      ),
                      const Gap.v(h: 50),
                      Form(
                        key: controller.formKey,
                        child: CommonTextField(
                          isAutoValidate: true,
                          controller: controller.nominalC,
                          hintText: MyStrings.enterTopUpNominal,
                          prefixIcon: Icons.money,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (controller.selectedNominalIndex.value != -1) {
                              controller.selectedNominalIndex.value = -1;
                            }
                            if (value.length >= 6 &&
                                value.length <= 9 &&
                                (MyUtils.strThousandToInt(value) ?? 0) <=
                                    1000000) {
                              controller.isBtnDisabled(false);
                            } else {
                              controller.isBtnDisabled(true);
                            }
                            controller.formatWithThousandSeparator(
                              value,
                            );
                          },
                          validator: (value) {
                            return controller.validateInput(value);
                          },
                        ),
                      ),
                      const Gap.v(h: 20),
                      SizedBox(
                        height: 150,
                        width: Get.width,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of items in a row
                            crossAxisSpacing:
                                0.0, // Minimal horizontal spacing between items
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 20 / 9,
                          ),
                          itemCount: controller.nominal.length,
                          itemBuilder: (context, index) {
                            final data = controller.nominal;
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.nominalC.clear();
                                  FocusScope.of(context).unfocus();
                                  controller.formKey.currentState?.reset();
                                  controller.selectedNominalIndex.value = index;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: controller.selectedNominalIndex
                                                    .value ==
                                                index
                                            ? Themes.red
                                            : Themes.grayColor,
                                      ),
                                      color: controller
                                                  .selectedNominalIndex.value ==
                                              index
                                          ? Themes.red20.withOpacity(0.5)
                                          : Themes.transparent),
                                  child: Center(
                                    child: Text(
                                      Converter.convertToRp(
                                        data[index],
                                      ),
                                      style: Get.textTheme.bodyLarge?.copyWith(
                                        color: controller.selectedNominalIndex
                                                    .value ==
                                                index
                                            ? Themes.red
                                            : Themes.darkColor,
                                      ),
                                    ),
                                  ),
                                ).marginSymmetric(horizontal: 3),
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap.v(h: 50),
                      Obx(
                        () => CommonButton(
                          backgroundColor:
                              controller.selectedNominalIndex.value != -1 ||
                                      controller.isBtnDisabled.isFalse
                                  ? Themes.red
                                  : Themes.grayColor,
                          child: const Text(
                            MyStrings.topUp,
                          ),
                          onPressed: () {
                            if (controller.selectedNominalIndex.value != -1 ||
                                controller.isBtnDisabled.isFalse) {
                              const WarningAlertDialog().warningAlertDialog(
                                Get.context!,
                                MyStrings.recheck,
                                MyStrings.topUpMessage,
                                () async {
                                  controller.topUp();
                                },
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
