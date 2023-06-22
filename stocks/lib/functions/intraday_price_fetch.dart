import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stocks/utils/constants.dart';

import '../models/intraday_model.dart';
import 'package:http/http.dart' as http;

Future<StockData?> fetchStockData(String compSymbol) async {
  try {
    var u = Uri.parse(
        "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$compSymbol&interval=15min&apikey=JWD65CRD17BR4ZX2");
    debugPrint(u.toString());
    final response = await http.get(u);
    if (response.statusCode == 200) {
      //debugPrint(response.body);
      final jsonBody = json.decode(response.body);
      debugPrint("jsonBody ${jsonBody}");
      return StockData.fromJson(jsonBody);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
