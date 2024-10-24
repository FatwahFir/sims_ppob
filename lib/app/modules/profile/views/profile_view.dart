import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/shared/components/avatar_field.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/shared/components/common_text_field.dart';
import 'package:sims_ppob/app/shared/components/loading_indicator.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.account),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const LoadingIndicatior()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              AvatarField(
                                onChange: (image) =>
                                    controller.updateImage(image),
                                networkImage: Box.user?.profileImage ?? '-',
                              ),
                              const Gap.v(h: 20),
                              Text(
                                "${Box.user?.firstName ?? ''} ${Box.user?.lastName ?? ''}",
                                style: Get.textTheme.displayLarge,
                              ),
                            ],
                          ),
                        ),
                        const Gap.v(h: 30),
                        Text(
                          MyStrings.email,
                          style: Get.textTheme.labelLarge,
                        ),
                        const Gap.v(h: 12),
                        CommonTextField(
                          readOnly: true,
                          controller: controller.emailC,
                          prefixIcon: Icons.alternate_email,
                        ),
                        const Gap.v(h: 12),
                        Text(
                          MyStrings.firstName,
                          style: Get.textTheme.labelLarge,
                        ),
                        const Gap.v(h: 12),
                        CommonTextField(
                          readOnly: controller.isEditMode.isFalse,
                          controller: controller.firstNameC,
                          prefixIcon: Icons.person_2_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return MyStrings.requiredMsg;
                            }
                            return null;
                          },
                        ),
                        const Gap.v(h: 12),
                        Text(
                          MyStrings.lastName,
                          style: Get.textTheme.labelLarge,
                        ),
                        const Gap.v(h: 12),
                        CommonTextField(
                          readOnly: controller.isEditMode.isFalse,
                          controller: controller.lastNameC,
                          prefixIcon: Icons.person_2_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return MyStrings.requiredMsg;
                            }
                            return null;
                          },
                        ),
                        const Gap.v(h: 40),
                        Visibility(
                          visible: controller.isEditMode.isFalse,
                          child: Column(
                            children: [
                              CommonButton(
                                hasBorderSide: true,
                                borderColor: Themes.red,
                                backgroundColor: Themes.white,
                                child: Text(
                                  MyStrings.editProfile,
                                  style: TextStyle(color: Themes.red),
                                ),
                                onPressed: () => controller.isEditMode(true),
                              ),
                              const Gap.v(h: 15),
                              CommonButton(
                                child: const Text(MyStrings.logout),
                                onPressed: () {
                                  Box.session.erase();
                                  Get.offAllNamed(Routes.AUTH);
                                },
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.isEditMode.isTrue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonButton(
                                child: const Text(MyStrings.save),
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.formKey.currentState!.save();
                                    controller.updateProfile();
                                  }
                                },
                              ),
                              const Gap.v(h: 20),
                              CommonButton(
                                hasBorderSide: true,
                                borderColor: Themes.red,
                                backgroundColor: Themes.white,
                                child: Text(
                                  MyStrings.cancel,
                                  style: TextStyle(color: Themes.red),
                                ),
                                onPressed: () => controller.isEditMode(false),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
