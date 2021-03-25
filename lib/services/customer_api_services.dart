import 'dart:convert';

import 'package:fertilizer_app/models/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerApi {
  final client = http.Client();

  Future<List<CustomerModel>> fetchCustomers() async {
    var response = await client.get(
        Uri.parse("https://60498b66fb5dcc001796a31e.mockapi.io/Customer"),
        headers: {
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      return listCustomerModelFromJson(utf8.decode(response.bodyBytes));
    } else {
      print("cannot connect to server");
      return null;
    }
  }

  Future<CustomerModel> createCustomer(CustomerModel model) async {
    var request = await client.post(
      Uri.parse("https://60498b66fb5dcc001796a31e.mockapi.io/Customer"),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode(<String, dynamic>{
        'Name': model.name,
        'Address': model.address,
        'TotalDebt': 0
      }),
    );
    print(request.statusCode);
    if (request.statusCode == 200 || request.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
      return customerModelFromJson(utf8.decode(request.bodyBytes));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to add customer.');
    }
  }
}
