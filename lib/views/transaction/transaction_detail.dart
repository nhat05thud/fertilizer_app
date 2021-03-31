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
        backgroundColor: Colors.teal,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: currentTransaction.productTransactions.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? customerInfomation(Get.arguments)
                    : listProducts(index - 1);
              },
            );
          }
        },
      ),
    );
  }

  Widget customerInfomation(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tên: " +
                "${controller.listTransactionOnDisplay[index].customerName}"
                    .toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Ngày mua: " +
                DateFormat('dd/MM/yyyy').format(
                    controller.listTransactionOnDisplay[index].createDate),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Tổng tiền: " +
              "${ NumberFormat("#,###").format(controller.listTransactionOnDisplay[index].totalPrice)}" +
              " VNĐ"),
          // SizedBox(
          //   height: 7,
          // ),
          // Row(
          //   children: [
          //     Text("Đã trả: "),
          //     Text(
          //       "0",
          //       style: TextStyle(
          //           color: Colors.green[500],
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16),
          //     ),
          //     Text(" VNĐ"),
          //   ],
          // ),
          // SizedBox(
          //   height: 7,
          // ),
          // Row(
          //   children: [
          //     Text("Nợ: "),
          //     Text(
          //       "0",
          //       style: TextStyle(
          //           color: Colors.red[500],
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16),
          //     ),
          //     Text(" VNĐ"),
          //   ],
          // ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Sản phẩm đã mua:".toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget listProducts(int index) {
    return controller.listTransactionOnDisplay[Get.arguments]
                .productTransactions[index] !=
            null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey[200], width: 1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${controller.listTransactionOnDisplay[Get.arguments].productTransactions[index].productName}"),
                      SizedBox(
                        height: 7,
                      ),
                      Text("Giá: " +
                          NumberFormat("#,###").format(controller
                              .listTransactionOnDisplay[Get.arguments]
                              .productTransactions[index]
                              .price) +
                          " VNĐ")
                    ],
                  ),
                  Text(
                      "x${controller.listTransactionOnDisplay[Get.arguments].productTransactions[index].quantity}"),
                ],
              ),
            ),
          )
        : null;
  }
}
