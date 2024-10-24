import 'package:get/get.dart';
import 'package:sims_ppob/app/utils/box.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/core/bindings/core_binding.dart';
import '../modules/core/views/core_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/top_up/bindings/top_up_binding.dart';
import '../modules/top_up/views/top_up_view.dart';
import '../modules/transaction_history/bindings/transaction_history_binding.dart';
import '../modules/transaction_history/views/transaction_history_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.TRANSACTION_HISTORY;
  static var INITIAL = Box.token != null ? Routes.CORE : Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
        name: _Paths.CORE,
        page: () => CoreView(),
        binding: CoreBinding(),
        bindings: [
          HomeBinding(),
          TopUpBinding(),
          TransactionHistoryBinding(),
        ]),
    GetPage(
      name: _Paths.TOP_UP,
      page: () => TopUpView(),
      binding: TopUpBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY,
      page: () => TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
  ];
}
