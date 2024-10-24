import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

class WarningAlertDialog {
  const WarningAlertDialog();

  void warningAlertDialog(
      BuildContext context, String title, String message, VoidCallback press) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Themes.white,
              insetPadding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 40, bottom: 15, left: 15, right: 15),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Themes.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: Get.textTheme.labelLarge!
                                .copyWith(color: Themes.red),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            message,
                            style: Get.textTheme.bodySmall!
                                .copyWith(color: Themes.darkColor),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CommonButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  hasBorderSide: true,
                                  borderColor: Themes.red,
                                  backgroundColor: Themes.white,
                                  child: Text(
                                    MyStrings.no,
                                    style: Get.textTheme.labelMedium
                                        ?.copyWith(color: Themes.red),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: CommonButton(
                                onPressed: press,
                                backgroundColor: Themes.primaryColor,
                                child: Text(
                                  MyStrings.yes,
                                  style: Get.textTheme.labelMedium
                                      ?.copyWith(color: Themes.white),
                                ),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -30,
                      left: MediaQuery.of(context).padding.left,
                      right: MediaQuery.of(context).padding.right,
                      child: Image.asset(
                        MyPath.warningImage,
                        height: 60,
                        width: 60,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
