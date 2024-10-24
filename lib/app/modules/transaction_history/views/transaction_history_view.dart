import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/data/models/transaction_model.dart';
import 'package:sims_ppob/app/shared/components/balance_widget.dart';
import 'package:sims_ppob/app/shared/components/loading_indicator.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/converter.dart';
import 'package:sims_ppob/app/utils/date_formatter.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.payment),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: Themes.red,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () => controller.getTransactionHistories(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BalanceWidget(balance: Box.balance ?? 0),
                    const Gap.v(h: 40),
                    Text(
                      MyStrings.transaction,
                      style: Get.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  controller.obx(
                    (data) {
                      if (data != null) {
                        return Column(
                          children: List.generate(
                            data.length,
                            (i) => TransactionHistoryTile(data: data[i])
                                .marginOnly(bottom: 20),
                          ),
                        );
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    },
                    onLoading: const LoadingIndicatior(),
                    onEmpty: RefreshWidget(
                      message: MyStrings.noTransaction,
                      onRefresh: () => controller.getTransactionHistories(),
                    ),
                    onError: (_) => RefreshWidget(
                      message: MyStrings.somethingWentWrong,
                      onRefresh: () => controller.getTransactionHistories(),
                    ),
                  ),
                  Obx(
                    () => controller.isShowMoreBtn.isTrue
                        ? Center(
                            child: TextButton(
                              onPressed: () {
                                controller.offset =
                                    controller.offset + controller.limit;
                                controller.moreTransactionHistories();
                              },
                              child: Text(
                                MyStrings.more,
                                style: Get.textTheme.bodyMedium?.copyWith(
                                  color: Themes.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  )
                ]),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
    this.onRefresh,
    this.message = MyStrings.refresh,
  });

  final VoidCallback? onRefresh;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            message ?? '-',
            style: Get.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: onRefresh,
            icon: Icon(
              Icons.refresh_rounded,
              color: Themes.red,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionHistoryTile extends StatelessWidget {
  const TransactionHistoryTile({
    super.key,
    required this.data,
  });

  final Transaction data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 80,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Themes.grayColor,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data.transactionType == "TOPUP" ? '+' : '-'} ${Converter.convertToRp(data.totalAmount ?? 0)}",
                style: Get.textTheme.displayLarge?.copyWith(
                  color: data.transactionType == "TOPUP"
                      ? Themes.green
                      : Themes.red,
                ),
              ),
              Text(
                '${DateFormatter.ddMMyyyyHHmm(data.createdOn!, locale: 'id')} WIB',
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Themes.dark20,
                ),
              ),
            ],
          ),
          Text(
            data.description ?? '-',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: Themes.dark50,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
