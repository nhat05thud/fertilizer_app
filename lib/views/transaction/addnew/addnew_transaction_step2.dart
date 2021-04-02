import 'package:fertilizer_app/components/search.dart';
import 'package:fertilizer_app/controllers/addnew_transaction_controller.dart';
import 'package:fertilizer_app/controllers/warehouse_controller.dart';
import 'package:fertilizer_app/models/transaction_model.dart';
import 'package:fertilizer_app/views/transaction/addnew/addnew_transaction_step3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTransactionStep2 extends StatelessWidget {
  final AddNewTransactionController controller =
      Get.put(AddNewTransactionController());
  final WareHouseController warehouseController =
      Get.put(WareHouseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn sản phẩm"),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            controller.transactionModel.productTransactions =
                <ProductTransaction>[];
            Get.back();
          },
        ),
      ),
      body: GetBuilder<AddNewTransactionController>(builder: (controller) {
        if (warehouseController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: warehouseController.listWareHouseDisplay.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == 0 ? searchBar() : wareHouseItem(index - 1);
            },
          );
        }
      }),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: SearchBar(onChanged: 
                  warehouseController.searchListWareHouse,)
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 45,
              child: TextButton(
                onPressed: () {
                  if (controller.transactionModel.productTransactions.length >
                      0) {
                    Get.to(AddTransactionStep3());
                  }
                },
                child: Text("Chọn"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor:
                      controller.transactionModel.productTransactions.length > 0
                          ? Colors.teal
                          : Colors.teal[300],
                  onSurface: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget wareHouseItem(int index) {
    return GestureDetector(
      onTap: () {
        controller.addListProductsToCart(
            warehouseController.listWareHouseDisplay[index]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              CupertinoIcons.cube_fill,
              color: Colors.grey,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${warehouseController.listWareHouseDisplay[index].name}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Đơn giá: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    NumberFormat("#,###").format(warehouseController
                            .listWareHouseDisplay[index].price) +
                        " VNĐ / 1 sản phẩm",
                  ),
                ],
              ),
            ],
          ),
          trailing: controller.transactionModel.productTransactions
                      .where((element) =>
                          element.productName ==
                          warehouseController.listWareHouseDisplay[index].name)
                      .length >
                  0
              ? Icon(Icons.check)
              : null,
        ),
      ),
    );
  }
}
