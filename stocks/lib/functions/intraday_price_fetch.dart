import 'dart:convert';
import '../models/intraday_model.dart';
import 'package:http/http.dart' as http;

Future<StockData?> fetchStockData(String compSymbol) async {
  try {
    var url = Uri.parse(
        "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$compSymbol&interval=15min&apikey=G09OFK3V93LN6NU2");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //debugPrint(response.body);
      final jsonBody = json.decode(response.body);
      return StockData.fromJson(jsonBody);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
