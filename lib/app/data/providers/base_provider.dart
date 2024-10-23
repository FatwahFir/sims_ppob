// ignore_for_file: avoid_print
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/utils/box.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class BaseProvider extends GetConnect {
  void handleResponseError(Response response) {
    String message = '';
    switch (response.statusCode) {
      case 400:
        message = response.body['message'];
        break;
      case 401:
        message = MyStrings.unAuthorized;
        break;
      case 403:
        message = MyStrings.forbidden;
        break;
      case 404:
        message = MyStrings.noTrxFound;
        break;
      case 500:
        message = MyStrings.serverError;
        break;
      default:
        message =
            '${MyStrings.somethingWentWrong} Status code: ${response.statusCode}';
        break;
    }

    log(message);
    CustomSnackBar.error(errorList: [message]);
  }

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = MyStrings.host;
    print("Base URL: ${httpClient.baseUrl}");
    httpClient.addRequestModifier<dynamic>((request) async {
      try {
        print("Request url: ${request.url}");
        final List<ConnectivityResult> connectivityResult =
            await (Connectivity().checkConnectivity());

        if (!connectivityResult.contains(ConnectivityResult.none)) {
          request.headers['Authorization'] = 'Bearer ${Box.token}';
          request.headers['Accept'] = 'application/json';
        } else {
          throw const SocketException(MyStrings.noInternet);
        }
      } catch (e) {
        MyUtils.exceptionHandler(e);
      }

      print(request.headers);

      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      if (response.statusCode != 200 && response.statusCode != 201) {
        handleResponseError(response);
      }
      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      return request;
    });
  }
}
