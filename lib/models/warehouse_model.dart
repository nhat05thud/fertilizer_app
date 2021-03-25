import 'dart:convert';

List<WareHouseModel> listWareHouseModelFromJson(String str) => List<WareHouseModel>.from(json.decode(str).map((x) => WareHouseModel.fromJson(x)));

String listWareHouseModelToJson(List<WareHouseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

WareHouseModel wareHouseModelFromJson(String str) => WareHouseModel.fromJson(json.decode(str));

String wareHouseModelToJson(WareHouseModel data) => json.encode(data.toJson());

class WareHouseModel {
    WareHouseModel({
        this.id,
        this.name,
        this.price,
        this.quantity,
        this.description,
    });

    String id;
    String name;
    int price;
    int quantity;
    String description;

    factory WareHouseModel.fromJson(Map<String, dynamic> json) => WareHouseModel(
        id: json["id"],
        name: json["Name"],
        price: json["Price"],
        quantity: json["Quantity"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Price": price,
        "Quantity": quantity,
        "Description": description,
    };
}
