// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> listTransactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String listTransactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    TransactionModel({
        this.id,
        this.customerName,
        this.totalPrice,
        this.createDate,
        this.isDebt,
        this.productTransactions,
    });

    String id;
    String customerName;
    int totalPrice;
    DateTime createDate;
    bool isDebt;
    List<ProductTransaction> productTransactions;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json["id"],
        customerName: json["customerName"],
        totalPrice: json["totalPrice"],
        createDate: DateTime.parse(json["createDate"]),
        isDebt: json["isDebt"],
        productTransactions: List<ProductTransaction>.from(json["ProductTransactions"].map((x) => ProductTransaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customerName": customerName,
        "totalPrice": totalPrice,
        "createDate": createDate.toIso8601String(),
        "isDebt": isDebt,
        "ProductTransactions": List<dynamic>.from(productTransactions.map((x) => x.toJson())),
    };
}

class ProductTransaction {
    ProductTransaction({
        this.productId,
        this.productName,
        this.quantity,
        this.price,
    });

    int productId;
    String productName;
    int quantity;
    int price;

    factory ProductTransaction.fromJson(Map<String, dynamic> json) => ProductTransaction(
        productId: json["ProductId"],
        productName: json["ProductName"],
        quantity: json["Quantity"],
        price: json["Price"],
    );

    Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "ProductName": productName,
        "Quantity": quantity,
        "Price": price,
    };
}
