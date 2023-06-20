import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocks/utils/constants.dart';

import '../models/search_results_model.dart';

Future<SearchResults> fetchSearchResults(String searchText) async {
  final keywords = searchText;
  try {
    final response = await http.get(Uri.parse(
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$keywords&apikey=G09OFK3V93LN6NU2"));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return SearchResults.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  throw Exception('No search results');
}
