import 'package:fertilizer_app/models/customer_model.dart';
import 'package:fertilizer_app/services/customer_api_services.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  var isLoading = true.obs;
  var listCustomer = <CustomerModel>[];
  var listCustomerDisplay = <CustomerModel>[];

  var customerModel = new CustomerModel();

  void searchListCustomer(String text) {
    text = text.toLowerCase();
    var listSearch = listCustomer.where((e) {
      var customerName = e.name.toLowerCase();
      return customerName.contains(text);
    }).toList();
    listCustomerDisplay = listSearch;
    update();
  }
  void fetchCustomers() async {
    try {
      isLoading(true);
      var customers = await CustomerApi().fetchCustomers();
      if (customers != null) {
        listCustomer = listCustomerDisplay = customers.toList();
        update();
      }
    } finally {
      isLoading(false);
    }
  }
  void createCustomer(CustomerModel model) async{
    try {
      isLoading(true);
      await CustomerApi().createCustomer(model);
    } finally {
      Get.back();
      fetchCustomers();
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    fetchCustomers();
  }
}