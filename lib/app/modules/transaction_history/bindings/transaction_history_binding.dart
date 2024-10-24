import 'package:get/get.dart';
import 'package:sims_ppob/app/data/providers/transaction_provider.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionHistoryController>(
      () => TransactionHistoryController(),
    );
    Get.lazyPut<TransactionProvider>(
      () => TransactionProvider(),
    );
  }
}
