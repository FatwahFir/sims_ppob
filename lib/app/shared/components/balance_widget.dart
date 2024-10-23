import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/converter.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({
    super.key,
    required this.balance,
    this.isShowToggleBtn = false,
  });

  final int balance;
  final bool isShowToggleBtn;

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  late bool isShowBalance;
  @override
  void initState() {
    super.initState();
    isShowBalance = !widget.isShowToggleBtn;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Themes.red,
              Themes.redDark,
            ], // You can replace these with your desired colors
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.6, 1.0],
          ),
        ),
        width: Get.width - 45,
        height: widget.isShowToggleBtn ? 150 : 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              MyStrings.balance,
              style: Get.textTheme.bodyLarge?.copyWith(color: Themes.white),
            ),
            Text(
              isShowBalance
                  ? Converter.convertToRp(widget.balance)
                  : "Rp ••••••",
              style: Get.textTheme.displayLarge
                  ?.copyWith(fontSize: 36, color: Themes.white),
            ),
            widget.isShowToggleBtn
                ? Row(
                    children: [
                      Text(
                        MyStrings.showBalance,
                        style: Get.textTheme.bodyMedium
                            ?.copyWith(color: Themes.white),
                      ),
                      const Gap.h(w: 5),
                      GestureDetector(
                        child: Icon(
                          isShowBalance
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Themes.white,
                          size: 16,
                        ),
                        onTap: () => setState(() {
                          isShowBalance = !isShowBalance;
                        }),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
