import 'package:fertilizer_app/controllers/customer_controller.dart';
import 'package:fertilizer_app/views/customer/addnew_customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerPage extends StatelessWidget {
  final CustomerController controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
        return GetBuilder<CustomerController>(builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchCustomers();
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listCustomerDisplay.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? searchBar() : customerItem(index - 1);
              },
            ),
          );
        });
  }

   Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
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
                  contentPadding: EdgeInsets.only(
                    right: 30,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 16.0, left: 24.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
                onChanged: (text) {
                  controller.searchListCustomer(text);
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 45,
              child: TextButton(
                onPressed: () {
                  Get.to(AddNewCustomer());
                },
                child: Text("Thêm mới"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customerItem(int index) {
    return GestureDetector(
      onTap: () {
        //Get.to(TransactionDetail(), arguments: index);
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
              Text(
                "${controller.listCustomerDisplay[index].name}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),

              Text("Địa chỉ: " +
                "${controller.listCustomerDisplay[index].address != null ? controller.listCustomerDisplay[index].address : "chưa nhập địa chỉ"}",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Còn nợ: ", style: TextStyle(color: Colors.red[400])),
                  Text(
                    NumberFormat("#,###").format(
                            controller.listCustomerDisplay[index].totalDebt) +
                        " VNĐ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
