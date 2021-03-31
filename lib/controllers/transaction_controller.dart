import 'package:fertilizer_app/controllers/dashboard_controller.dart';
import 'package:fertilizer_app/models/transaction_model.dart';
import 'package:fertilizer_app/services/transaction_api_services.dart';
import 'package:fertilizer_app/views/dashboard.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final DashBoardController dashBoardController = Get.put(DashBoardController());
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

  void createTransaction(TransactionModel model) async{
    try {
      isLoading(true);
      await TransactionApi().createTransaction(model);
    } finally {
      Get.to(DashBoard());
      dashBoardController.tabIndex = 1;
      fetchTransactions();
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
