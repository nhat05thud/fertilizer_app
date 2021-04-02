import 'dart:ui';

import 'package:fertilizer_app/components/search.dart';
import 'package:fertilizer_app/controllers/transaction_controller.dart';
import 'package:fertilizer_app/views/transaction/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  final TransactionController controller = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(builder: (controller) {
      if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchTransactions();
            },
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listTransactionOnDisplay.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0 ? searchBar() : transactionItem(index - 1);
                },
              ),
          );
        }
    });
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(onChanged: controller.searchListTransaction,),
    );
  }

  Widget transactionItem(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(TransactionDetail(), arguments: index);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${controller.listTransactionOnDisplay[index].customerName}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Ngày mua: " +
                        DateFormat('dd/MM/yyyy').format(controller
                            .listTransactionOnDisplay[index].createDate),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("Tổng tiền: " +
                  NumberFormat("#,###").format(
                      controller.listTransactionOnDisplay[index].totalPrice) +
                  " VNĐ"),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          // subtitle: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           "Đã trả: ",
          //           style: TextStyle(color: Colors.green[400]),
          //         ),
          //         Text("100,000 VNĐ",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.bold, color: Colors.black87)),
          //       ],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text("Còn nợ: ", style: TextStyle(color: Colors.red[400])),
          //         Text("150,000 VNĐ",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.bold, color: Colors.black87)),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
