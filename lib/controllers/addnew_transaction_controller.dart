import 'package:fertilizer_app/controllers/dashboard_controller.dart';
import 'package:fertilizer_app/controllers/transaction_controller.dart';
import 'package:fertilizer_app/models/transaction_model.dart';
import 'package:fertilizer_app/models/warehouse_model.dart';
import 'package:fertilizer_app/services/transaction_api_services.dart';
import 'package:fertilizer_app/views/dashboard.dart';
import 'package:get/get.dart';

class AddNewTransactionController extends GetxController {
  final TransactionController transactionController = TransactionController();
  final DashBoardController dashboardController = Get.put(DashBoardController());
  var transactionModel = new TransactionModel().obs;
  
  void addListProductsToCart(WareHouseModel model) {
    var item = ProductTransaction();
    item.productName = model.name;
    item.price = model.price;
    item.quantity = 1;
    var isHaveItem = transactionModel.value.productTransactions.where((element) => element.productName == item.productName).length > 0;
    if (isHaveItem) {
      transactionModel.value.productTransactions.removeWhere((element) => element.productName == item.productName);
    }
    else{
      transactionModel.value.productTransactions.add(item);
    }
    update();
  }

  void deleteProduct(int index) {
    transactionModel.value.productTransactions.removeWhere((element) => element.productName == transactionModel.value.productTransactions[index].productName);
    update();
  }

  void quantityUp(int index){
    transactionModel.value.productTransactions[index].quantity++;
    update();
  }
  void quantityDown(int index){
    if (transactionModel.value.productTransactions[index].quantity > 1) {
      transactionModel.value.productTransactions[index].quantity--;
    }
    update();
  }

  void fetchTransactions() async {
    try {
      var transactions = await TransactionApi().fetchTransactions();
      if (transactions != null) {
        transactionController.listTransaction = transactionController.listTransactionOnDisplay = transactions.reversed.toList();
        update();
      }
    } finally {
    }
  }


  void createTransaction(TransactionModel model) async{
    try {
      await TransactionApi().createTransaction(model);
    } finally {
      fetchTransactions();
      dashboardController.tabIndex = 1;
      Get.to(DashBoard());
    }
  }

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      transactionModel.value.productTransactions = <ProductTransaction>[];
    }
}