import 'package:flutter/foundation.dart';
import 'package:flutter_mini_1/database/transaction_db.dart';
import 'package:flutter_mini_1/model/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactionss> transactions = [];

  List<Transactionss> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactionss statement) async {
    var db = TransactionDB(dbname: "transactions.db");

    await db.insertData(statement);

    await db.loadAllData();

    transactions.insert(0, statement);

    //แจ้งเตือน consumer
    notifyListeners();
  }
}
