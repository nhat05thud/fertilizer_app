import 'package:fertilizer_app/components/search.dart';
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
      body: GetBuilder<AddNewTransactionController>(
          builder: (controller) {
            if(customerController.isLoading.value){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return ListView.builder(
                itemCount: customerController.listCustomerDisplay.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0 ? searchBar() : customerItem(index - 1);
                },
              );
            }
          },
        ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(onChanged: customerController.searchListCustomer,),
    );
  }

  Widget customerItem(int index) {
    return GestureDetector(
      onTap: () {
        controller.transactionModel.customerName = customerController.listCustomerDisplay[index].name;
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
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
