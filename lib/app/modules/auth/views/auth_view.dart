import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/components/common_button.dart';
import 'package:sims_ppob/app/shared/components/common_text_field.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

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
                    "Masuk atau buat akun untuk memulai",
                    style: Get.textTheme.displayLarge?.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  const Gap.v(h: 20),
                  CommonTextField(
                    controller: controller.email,
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
                  const Gap.v(h: 10),
                  Obx(
                    () => CommonTextField(
                      controller: controller.password,
                      prefixIcon: Icons.lock_outline_rounded,
                      hintText: MyStrings.passwordHint,
                      obscureText: controller.showPassword.value,
                      suffixIcon: controller.showPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onPressSuffix: () {
                        controller.showPassword.toggle();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return MyStrings.requiredMsg;
                        } else if (value.length < 8) {
                          return MyStrings.invalidLengthPassMsg;
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap.v(h: 45),
                  CommonButton(
                    child: const Text(MyStrings.login),
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.login();
                      }
                    },
                  ),
                  const Gap.v(h: 30),
                  RichText(
                    text: TextSpan(
                      text: 'belum punya akun? registrasi ',
                      style: Get.textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'di sini',
                            style: TextStyle(
                              color: Themes.red,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
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
