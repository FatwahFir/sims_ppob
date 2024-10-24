import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';

class MyUtils {
  static List<T> fromJsonList<T>(
      List? data, T Function(Map<String, dynamic>) fromJson) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  static void exceptionHandler(dynamic error) {
    String message = '';
    if (error is NoSuchMethodError) {
      log(error.toString());
    } else {
      if (error is SocketException) {
        message = MyStrings.noInternet;
      } else if (error is TimeoutException) {
        message = MyStrings.rto;
      } else {
        message = MyStrings.somethingWentWrong;
      }
      log(error.toString());
      log(message);
      CustomSnackBar.error(errorList: [message]);
    }
  }

  static String cleanThousandSeparator(String value) {
    return value.replaceAll('.', '');
  }

  static String strThousandFormat(String value) {
    int parsedValue = int.parse(cleanThousandSeparator(value));
    final NumberFormat numberFormat = NumberFormat('#,###', 'en_US');
    return numberFormat.format(parsedValue).replaceAll(',', '.');
  }

  static int? strThousandToInt(String val) {
    return int.tryParse(val.replaceAll('.', ''));
  }
}
