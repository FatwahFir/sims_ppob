import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/shared/components/common_text_field.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        MyPath.logo,
                        width: 25,
                      ),
                      const Gap.h(w: 10),
                      Text(
                        MyStrings.appName,
                        style: Get.textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const Gap.v(h: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Lengkapi data untuk membuat akun",
                    style: Get.textTheme.displayLarge?.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  const Gap.v(h: 50),
                  CommonTextField(
                    controller: controller.emailController,
                    prefixIcon: Icons.alternate_email,
                    hintText: MyStrings.yourEmail,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return MyStrings.requiredMsg;
                      } else if (!GetUtils.isEmail(value)) {
                        return MyStrings.invalidEmailMsg;
                      }
                      return null;
                    },
                  ),
                  const Gap.v(h: 30),
                  CommonTextField(
                    controller: controller.firstNameController,
                    prefixIcon: Icons.person,
                    hintText: MyStrings.firstName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return MyStrings.requiredMsg;
                      }
                      return null;
                    },
                  ),
                  const Gap.v(h: 30),
                  CommonTextField(
                    controller: controller.lastNameController,
                    prefixIcon: Icons.person,
                    hintText: MyStrings.lastName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return MyStrings.requiredMsg;
                      }
                      return null;
                    },
                  ),
                  const Gap.v(h: 30),
                  Obx(
                    () => CommonTextField(
                      isAutoValidate: true,
                      controller: controller.passwordController,
                      prefixIcon: Icons.lock_outline_rounded,
                      hintText: MyStrings.newPassword,
                      obscureText: !controller.isPasswordVisible.value,
                      suffixIcon: !controller.isPasswordVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onPressSuffix: () {
                        controller.isPasswordVisible.toggle();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return MyStrings.requiredMsg;
                        } else if (value.length < 8) {
                          return MyStrings.invalidLengthPassMsg;
                        } else if (!controller.validatePassword(value)) {
                          return MyStrings
                              .invalidPassMsg; // Custom message for password complexity
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap.v(h: 30),
                  Obx(
                    () => CommonTextField(
                      controller: controller.reTypePasswordController,
                      prefixIcon: Icons.lock_outline_rounded,
                      hintText: MyStrings.reTypePassword,
                      obscureText: !controller.isReTypePasswordVisible.value,
                      suffixIcon: !controller.isReTypePasswordVisible.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onPressSuffix: () {
                        controller.isReTypePasswordVisible.toggle();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return MyStrings.requiredMsg;
                        } else if (value !=
                            controller.passwordController.text) {
                          return MyStrings
                              .passwordNotMatchMsg; // Custom message for password mismatch
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap.v(h: 45),
                  Obx(
                    () => controller.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Themes.red,
                            ),
                          )
                        : CommonButton(
                            child: const Text(MyStrings.register),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.register();
                              }
                            },
                          ),
                  ),
                  const Gap.v(h: 30),
                  RichText(
                    text: TextSpan(
                      text: 'sudah punya akun? login ',
                      style: Get.textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'di sini',
                          style: TextStyle(
                            color: Themes.red,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.offNamed(Routes.AUTH),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
