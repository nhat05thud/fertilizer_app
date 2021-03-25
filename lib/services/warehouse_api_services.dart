import 'dart:convert';

import 'package:fertilizer_app/models/warehouse_model.dart';
import 'package:http/http.dart' as http;

class WareHouseApi {
  final client = http.Client();

  Future<List<WareHouseModel>> fetchWarehouses() async {
    var responsive = await client.get(Uri.parse("https://60498b66fb5dcc001796a31e.mockapi.io/Products"), headers: {"Accept": "application/json",});
    if (responsive.statusCode == 200) {
      return listWareHouseModelFromJson(utf8.decode(responsive.bodyBytes));
    }
    else{
      print("cannot connect to server");
      return null;
    }
  }
  Future<WareHouseModel> createWareHouse(WareHouseModel model) async {
    var request = await client.post(
      Uri.parse("https://60498b66fb5dcc001796a31e.mockapi.io/Products"),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode(<String, dynamic>{
        'Name': model.name,
        'Price': model.price,
        'Quantity': model.quantity,
        'Description': model.description
      }),
    );
    print(request.statusCode);
    if (request.statusCode == 200 || request.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
      return wareHouseModelFromJson(utf8.decode(request.bodyBytes));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to add customer.');
    }
  }
}
