import 'package:fertilizer_app/views/customer.dart';
import 'package:fertilizer_app/views/home.dart';
import 'package:fertilizer_app/views/transaction.dart';
import 'package:fertilizer_app/views/warehouse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;
  
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void setCurrentWidgetView(int index){
    tabIndex = index;
    update();
  }

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
    }
}
