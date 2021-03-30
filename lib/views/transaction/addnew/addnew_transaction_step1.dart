import 'package:fertilizer_app/controllers/addnew_transaction_controller.dart';
import 'package:fertilizer_app/controllers/customer_controller.dart';
import 'package:fertilizer_app/views/transaction/addnew/addnew_transaction_step2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewTransactionStep1 extends StatelessWidget {
  final AddNewTransactionController controller =
      Get.put(AddNewTransactionController());
  final CustomerController customerController =
      Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn người mua"),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if(customerController.isLoading.value){
          return Center(child: CircularProgressIndicator());
        }
        else{
          return GetBuilder<AddNewTransactionController>(
          builder: (controller){
            return ListView.builder(
              itemCount: customerController.listCustomerDisplay.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? searchBar() : customerItem(index - 1);
              },
            );
          },
        );
        }
      }),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
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
          customerController.searchListCustomer(text);
        },
      ),
    );
  }

  Widget customerItem(int index) {
    return GestureDetector(
      onTap: () {
        controller.transactionModel.value.customerName = customerController.listCustomerDisplay[index].name;
        Get.to(AddTransactionStep2());
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
              Icons.person,
              color: Colors.grey,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${customerController.listCustomerDisplay[index].name}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Địa chỉ: " +
                "${customerController.listCustomerDisplay[index].address}",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
