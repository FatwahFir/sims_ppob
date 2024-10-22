class MyUtils {
  static List<T> fromJsonList<T>(
      List? data, T Function(Map<String, dynamic>) fromJson) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  // static void exceptionHandler(dynamic error) {
  //   String message = '';
  //   if (error is SocketException) {
  //     message = MyStrings.noInternet;
  //   } else if (error is TimeoutException) {
  //     message = MyStrings.rto;
  //   } else {
  //     message = MyStrings.somethingWentWrong;
  //   }
  //   log(error.toString());
  //   CustomSnackBar.error(errorList: [message]);
  // }
}
