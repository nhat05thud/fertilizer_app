import 'package:fertilizer_app/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionDetail extends StatelessWidget {
  final TransactionController controller = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    final currentTransaction =
        controller.listTransactionOnDisplay[Get.arguments];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTransaction.customerName),
      ),
      body: ListView.builder(
        itemCount: currentTransaction.productTransactions.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? customerInfomation(Get.arguments) : listProducts(index - 1);
        },
      ),
    );
  }

  Widget customerInfomation(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${controller.listTransactionOnDisplay[index].customerName}"),
        Text("${controller.listTransactionOnDisplay[index].createDate}"),
        Text("${controller.listTransactionOnDisplay[index].totalPrice}"),
        Text("${controller.listTransactionOnDisplay[index].isDebt}"),
      ],
    );
  }

  Widget listProducts(int index) {
    return Text(controller.listTransactionOnDisplay[Get.arguments]
                .productTransactions[index] !=
            null
        ? "${controller.listTransactionOnDisplay[Get.arguments].productTransactions[index].productName}"
        : "no item");
  }
}
