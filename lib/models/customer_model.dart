import 'dart:convert';

List<CustomerModel> listCustomerModelFromJson(String str) => List<CustomerModel>.from(json.decode(str).map((x) => CustomerModel.fromJson(x)));

String listCustomerModelToJson(List<CustomerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    CustomerModel({
        this.id,
        this.name,
        this.address,
        this.totalDebt,
    });

    String id;
    String name;
    String address;
    int totalDebt;

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        name: json["Name"],
        address: json["Address"],
        totalDebt: json["TotalDebt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Address": address,
        "TotalDebt": totalDebt,
    };
}
