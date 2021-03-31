import 'package:fertilizer_app/controllers/addnew_transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeQuantity extends StatelessWidget {
  final AddNewTransactionController controller =
      Get.put(AddNewTransactionController());
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddNewTransactionController>(
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.quantityDown(Get.arguments);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      ),
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "${controller.transactionModel.productTransactions[Get.arguments].quantity}",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {
                        controller.quantityUp(Get.arguments);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        backgroundColor: Colors.teal
                      ),
                      child: Text("Đồng ý"),
                    ),
              ],
            ),
          );
        }
      ),
    );
  }
}
