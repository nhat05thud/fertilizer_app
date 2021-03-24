import 'package:fertilizer_app/models/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionApi {
  final client = http.Client();

  Future<List<TransactionModel>> fetchTransactions() async {
    var responsive = await client.get(Uri.parse("https://60498b66fb5dcc001796a31e.mockapi.io/Transaction"));
    if (responsive.statusCode == 200) {
      return transactionModelFromJson(responsive.body);
    }
    else{
      print("cannot connect to server");
      return null;
    }
  }
}
