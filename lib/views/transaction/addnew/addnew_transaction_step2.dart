import 'package:fertilizer_app/controllers/addnew_transaction_controller.dart';
import 'package:fertilizer_app/controllers/warehouse_controller.dart';
import 'package:fertilizer_app/models/warehouse_model.dart';
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
            warehouseController.choiceList = <WareHouseModel>[];
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (warehouseController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GetBuilder<WareHouseController>(builder: (controller) {
            return ListView.builder(
              itemCount: warehouseController.listWareHouseDisplay.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? searchBar() : wareHouseItem(index - 1);
              },
            );
          });
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
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.only(
                    right: 30,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 24.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
                onChanged: (text) {
                  warehouseController.searchListWareHouse(text);
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 45,
              child: TextButton(
                onPressed: () {
                  Get.to(AddTransactionStep3());
                },
                child: Text("Chọn"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
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
        warehouseController.choiceProducts(index);
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
          trailing: warehouseController.choiceList
                  .contains(warehouseController.listWareHouseDisplay[index])
              ? Icon(Icons.check)
              : null,
        ),
      ),
    );
  }
}
