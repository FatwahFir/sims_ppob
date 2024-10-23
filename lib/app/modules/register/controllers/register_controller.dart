import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:sims_ppob/app/data/providers/register_provider.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isReTypePasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _provider = Get.find<RegisterProvider>();

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    reTypePasswordController.dispose();
    super.onClose();
  }

  bool validatePassword(String password) {
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasLowerCase = password.contains(RegExp(r'[a-z]'));
    final hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final isValidLength = password.length >= 8;

    return hasUpperCase &&
        hasDigits &&
        hasLowerCase &&
        hasSpecialCharacters &&
        isValidLength;
  }

  Future<void> register() async {
    try {
      isLoading(true);
      var data = {
        "email": emailController.text,
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "password": passwordController.text
      };
      var res = await _provider.register(data);
      if (res.statusCode == HttpStatus.ok) {
        CustomSnackBar.success(successList: [res.body['message']]);
        Get.offNamed(Routes.AUTH);
      }
    } catch (e) {
      MyUtils.exceptionHandler(e);
    } finally {
      isLoading(false);
    }
  }
}
