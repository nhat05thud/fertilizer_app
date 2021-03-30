import 'package:fertilizer_app/models/transaction_model.dart';
import 'package:fertilizer_app/services/transaction_api_services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var isLoading = true.obs;
  var listTransaction = <TransactionModel>[];
  var listTransactionOnDisplay = <TransactionModel>[];

  //detail page
  final currentTransaction = <TransactionModel>[];

  void searchListTransaction(String text) {
    text = text.toLowerCase();
    var listSearch = listTransaction.where((e) {
      var customerName = e.customerName.toLowerCase();
      return customerName.contains(text);
    }).toList();
    listTransactionOnDisplay = listSearch;
    update();
  }

  void fetchTransactions() async {
    try {
      isLoading(true);
      var transactions = await TransactionApi().fetchTransactions();
      if (transactions != null) {
        listTransaction = listTransactionOnDisplay = transactions.reversed.toList();
        update();
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    fetchTransactions();
  }
}
