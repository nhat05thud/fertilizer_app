import 'package:fertilizer_app/components/LoadingIndicator.dart';
import 'package:fertilizer_app/controllers/warehouse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewWareHouse extends StatelessWidget {
  final WareHouseController controller = Get.put(WareHouseController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm mới"),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nhập tên sản phẩm';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Tên sản phẩm',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                      onChanged: (text) {
                        controller.wareHouseModel.name = text;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nhập giá sản phẩm';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Đơn giá / 1 sản phẩm',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        controller.wareHouseModel.price = int.parse(text);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nhập số lượng';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Số lượng',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        controller.wareHouseModel.quantity = int.parse(text);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      minLines: 5,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Mô tả ngắn',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                      onChanged: (text) {
                        controller.wareHouseModel.description = text;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          controller.createWarehouse(controller.wareHouseModel);
                        }
                      },
                      child: Text("Thêm mới"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => Align(
                child: LoadingIndicator(isLoading: controller.isLoading.value),
                alignment: FractionalOffset.center,
              )),
        ],
      ),
    );
  }
}
