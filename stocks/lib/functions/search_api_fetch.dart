import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocks/utils/constants.dart';

import '../models/search_results_model.dart';

Future<SearchResults> fetchSearchResults(String searchText) async {
  final keywords = searchText;
  var u = Uri.parse(
      "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$keywords&apikey=JWD65CRD17BR4ZX2");
  try {
    debugPrint(u.toString());
    final response = await http.get(u);

    if (response.statusCode == 200) {
      return SearchResults.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  throw Exception('No search results');
}
