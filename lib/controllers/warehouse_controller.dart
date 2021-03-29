import 'package:fertilizer_app/models/warehouse_model.dart';
import 'package:fertilizer_app/services/warehouse_api_services.dart';
import 'package:get/get.dart';

class WareHouseController extends GetxController {
  var isLoading = true.obs;
  var listWareHouse = <WareHouseModel>[];
  var listWareHouseDisplay = <WareHouseModel>[];
  var wareHouseModel = new WareHouseModel();
  var choiceList = <WareHouseModel>[];

  void choiceProducts(int index){
    if (choiceList.contains(listWareHouseDisplay[index])) {
      choiceList.remove(listWareHouseDisplay[index]);
    } else {
      choiceList.add(listWareHouseDisplay[index]);
    }
    update();
  }

  void searchListWareHouse(String text) {
    text = text.toLowerCase();
    var listSearch = listWareHouse.where((e) {
      var productName = e.name.toLowerCase();
      return productName.contains(text);
    }).toList();
    listWareHouseDisplay = listSearch;
    update();
  }
  void fetchWarehouses() async {
    try {
      isLoading(true);
      var warehouses = await WareHouseApi().fetchWarehouses();
      if (warehouses != null) {
        listWareHouse = listWareHouseDisplay = warehouses.toList();
        update();
      }
    } finally {
      isLoading(false);
    }
  }
  void createWarehouse(WareHouseModel model) async{
    try {
      isLoading(true);
      await WareHouseApi().createWareHouse(model);
    } finally {
      Get.back();
      fetchWarehouses();
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    fetchWarehouses();
  }
}