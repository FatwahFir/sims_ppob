import 'package:sims_ppob/app/data/models/transaction_model.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';
import 'package:sims_ppob/app/utils/my_utils.dart';

class TransactionProvider extends BaseProvider {
  Future<List<Transaction>> getTransactionHistories(
      int offset, int limit) async {
    var res = await get(
      "/transaction/history?offset=$offset&limit=$limit",
    );
    print(res.body);
    return MyUtils.fromJsonList<Transaction>(
      res.body['data']['records'],
      Transaction.fromJson,
    );
  }
}
