import 'package:fertilizer_app/controllers/dashboard_controller.dart';
import 'package:fertilizer_app/views/customer.dart';
import 'package:fertilizer_app/views/home.dart';
import 'package:fertilizer_app/views/transaction.dart';
import 'package:fertilizer_app/views/transaction/addnew/addnew_transaction_step1.dart';
import 'package:fertilizer_app/views/warehouse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  final DashBoardController controller = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) => Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            TransactionPage(),
            WareHousePage(),
            CustomerPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddNewTransactionStep1());
          },
          backgroundColor: Colors.teal,
          child: Icon(CupertinoIcons.add),
        ),
        bottomNavigationBar: SizedBox(
          height: 75,
          child: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.teal,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house),
                label: "Trang chủ",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_dash),
                label: "Lịch sử giao dịch",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_grid_2x2),
                label: "Kho hàng",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: "Khách hàng",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
