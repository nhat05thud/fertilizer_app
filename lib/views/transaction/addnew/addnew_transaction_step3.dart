import 'package:fertilizer_app/components/LoadingIndicator.dart';
import 'package:fertilizer_app/controllers/addnew_transaction_controller.dart';
import 'package:fertilizer_app/controllers/transaction_controller.dart';
import 'package:fertilizer_app/views/transaction/addnew/change_quantity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddTransactionStep3 extends StatelessWidget {
  final AddNewTransactionController controller =
      Get.put(AddNewTransactionController());
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng"),
        backgroundColor: Colors.teal,
        actions: [
          TextButton(
              onPressed: () {
                controller.showLoading();
                transactionController
                    .createTransaction(controller.transactionModel);
              },
              child: Icon(
                Icons.done_all,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                      child: Text(
                    controller.transactionModel.customerName.toUpperCase(),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Sản phẩm đã chọn:".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<AddNewTransactionController>(builder: (controller) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        controller.transactionModel.productTransactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _productList(index);
                    });
              }),
            ],
          ),
          Obx(() => Align(child: LoadingIndicator(isLoading: controller.isLoading.value),alignment: FractionalOffset.center,)),
        ],
      ),
      bottomSheet: GetBuilder<AddNewTransactionController>(
        builder: (controller) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(color: Colors.teal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Tổng tiền: ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                "${NumberFormat("#,###").format(controller.transactionModel.productTransactions.map((e) => e.price * e.quantity).fold(0, (prev, amount) => prev + amount))} VNĐ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productList(int index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.grey[100]))),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.transactionModel.productTransactions[index].productName}",
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
                    NumberFormat("#,###").format(controller.transactionModel
                            .productTransactions[index].price) +
                        " VNĐ / 1 sản phẩm",
                  ),
                ],
              ),
            ],
          ),
          trailing: Text(
              "Số lượng: ${controller.transactionModel.productTransactions[index].quantity}"),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Sửa',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => {Get.to(ChangeQuantity(), arguments: index)},
        ),
        IconSlideAction(
          caption: 'Xóa',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => {controller.deleteProduct(index)},
        ),
      ],
    );
  }
}
