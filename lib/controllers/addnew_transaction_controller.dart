import 'package:fertilizer_app/controllers/dashboard_controller.dart';
import 'package:fertilizer_app/controllers/transaction_controller.dart';
import 'package:fertilizer_app/models/transaction_model.dart';
import 'package:fertilizer_app/models/warehouse_model.dart';
import 'package:get/get.dart';

class AddNewTransactionController extends GetxController {
  final TransactionController transactionController = TransactionController();
  final DashBoardController dashboardController = Get.put(DashBoardController());
  var transactionModel = new TransactionModel();
  var isLoading = false.obs;
  
  void addListProductsToCart(WareHouseModel model) {
    var item = ProductTransaction();
    item.productName = model.name;
    item.price = model.price;
    item.quantity = 1;
    var isHaveItem = transactionModel.productTransactions.where((element) => element.productName == item.productName).length > 0;
    if (isHaveItem) {
      transactionModel.productTransactions.removeWhere((element) => element.productName == item.productName);
    }
    else{
      transactionModel.productTransactions.add(item);
    }
    update();
  }

  void deleteProduct(int index) {
    transactionModel.productTransactions.removeWhere((element) => element.productName == transactionModel.productTransactions[index].productName);
    update();
  }

  void quantityUp(int index){
    transactionModel.productTransactions[index].quantity++;
    update();
  }
  void quantityDown(int index){
    if (transactionModel.productTransactions[index].quantity > 1) {
      transactionModel.productTransactions[index].quantity--;
    }
    update();
  }

  void showLoading() {
    isLoading.value = true;
    update();
  }

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      transactionModel.productTransactions = <ProductTransaction>[];
    }
}