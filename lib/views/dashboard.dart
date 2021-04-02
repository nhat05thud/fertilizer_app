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
          bottomNavigationBar: Container(
            height: 75,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              // borderRadius: BorderRadius.circular(100),
              // boxShadow: [
              //   BoxShadow(
              //     blurRadius: 2,
              //     spreadRadius: 2,
              //     offset: Offset(0,3),
              //     color: Colors.grey[200],
              //   ),
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setCurrentWidgetView(0);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      CupertinoIcons.house,
                      color: controller.tabIndex == 0
                          ? Colors.teal
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setCurrentWidgetView(1);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      CupertinoIcons.list_dash,
                      color: controller.tabIndex == 1
                          ? Colors.teal
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(AddNewTransactionStep1());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setCurrentWidgetView(2);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      CupertinoIcons.square_grid_2x2,
                      color: controller.tabIndex == 2
                          ? Colors.teal
                          : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setCurrentWidgetView(3);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      CupertinoIcons.person,
                      color: controller.tabIndex == 3
                          ? Colors.teal
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
