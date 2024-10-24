import 'package:get/get.dart';
import 'package:sims_ppob/app/data/models/transaction_model.dart';
import 'package:sims_ppob/app/data/providers/transaction_provider.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class TransactionHistoryController extends GetxController
    with StateMixin<List<Transaction>> {
  RxBool isLoading = false.obs;
  RxBool isShowMoreBtn = true.obs;
  final _provider = Get.find<TransactionProvider>();
  int limit = 5;
  int offset = 0;
  List<Transaction> transactions = [];

  @override
  void onInit() {
    super.onInit();
    getTransactionHistories();
  }

  Future<void> getTransactionHistories() async {
    try {
      change(transactions, status: RxStatus.loading());
      limit = 5;
      offset = 0;
      transactions.clear();
      transactions
          .addAll(await _provider.getTransactionHistories(offset, limit));
      if (transactions.isNotEmpty) {
        change(transactions, status: RxStatus.success());
      } else {
        change(transactions, status: RxStatus.empty());
        isShowMoreBtn(false);
      }
    } catch (e) {
      change(transactions, status: RxStatus.error());
      MyUtils.exceptionHandler(e);
    }
  }

  Future<void> moreTransactionHistories() async {
    try {
      change(transactions, status: RxStatus.loading());
      var res = await _provider.getTransactionHistories(offset, limit);
      if (res.isNotEmpty) {
        transactions
            .addAll(await _provider.getTransactionHistories(offset, limit));
      }
      change(transactions, status: RxStatus.success());
    } catch (e) {
      change(transactions, status: RxStatus.error());
      MyUtils.exceptionHandler(e);
    }
  }
}
