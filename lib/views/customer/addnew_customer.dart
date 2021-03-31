import 'package:fertilizer_app/components/LoadingIndicator.dart';
import 'package:fertilizer_app/controllers/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCustomer extends StatelessWidget {
  final CustomerController controller = Get.put(CustomerController());
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
                          return 'Nhập tên khách hàng';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Tên khách hàng',
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
                        controller.customerModel.name = text;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nhập địa chỉ khách hàng';
                        }
                        return null;
                      },
                      minLines: 5,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Địa chỉ',
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
                        controller.customerModel.address = text;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          controller.createCustomer(controller.customerModel);
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
