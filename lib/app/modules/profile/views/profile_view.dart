import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/components/avatar_field.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/shared/components/common_text_field.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.account),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  AvatarField(
                    onChange: (_) {},
                  ),
                  const Gap.v(h: 20),
                  Text(
                    "${Box.user?.firstName ?? ''} ${Box.user?.lastName ?? ''}",
                    style: Get.textTheme.displayLarge,
                  ),
                ],
              ),
            ),
            const Gap.v(h: 10),
            Text(
              MyStrings.email,
              style: Get.textTheme.labelLarge,
            ),
            // const Gap.v(h: 10),
            CommonTextField(
              controller: controller.emailC,
              prefixIcon: Icons.alternate_email,
            ),
            Text(
              MyStrings.firstName,
              style: Get.textTheme.labelLarge,
            ),
            // const Gap.v(h: 10),
            CommonTextField(
              controller: controller.firstNameC,
              prefixIcon: Icons.person_2_outlined,
            ),
            Text(
              MyStrings.lastName,
              style: Get.textTheme.labelLarge,
            ),
            // const Gap.v(h: 10),
            CommonTextField(
              controller: controller.lastNameC,
              prefixIcon: Icons.person_2_outlined,
            ),
            const Gap.v(h: 40),
            Visibility(
              child: Column(
                children: [
                  CommonButton(
                    hasBorderSide: true,
                    borderColor: Themes.red,
                    backgroundColor: Themes.transparent,
                    child: Text(
                      MyStrings.editProfile,
                      style: TextStyle(color: Themes.red),
                    ),
                  ),
                  const Gap.v(h: 20),
                  CommonButton(
                    child: const Text(MyStrings.logout),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonButton(
                    child: const Text(MyStrings.save),
                  ),
                  const Gap.v(h: 20),
                  CommonButton(
                    hasBorderSide: true,
                    borderColor: Themes.red,
                    backgroundColor: Themes.transparent,
                    child: Text(
                      MyStrings.cancel,
                      style: TextStyle(color: Themes.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
