import 'package:fertilizer_app/controllers/addnew_transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionStep3 extends StatelessWidget {
  final AddNewTransactionController controller =
      Get.put(AddNewTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn sản phẩm"),
        backgroundColor: Colors.teal
      ),
      body: Column(
        children: [
          Text("aa")
        ],
      )
    );
  }



}