import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/search_results_model.dart';

Future<SearchResults> fetchSearchResults(String searchText) async {
  final keywords = searchText;
  var url = Uri.parse(
      "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$keywords&apikey=JWD65CRD17BR4ZX2");
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return SearchResults.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    throw Exception(e);
    // we can use snackbar to display a custom exception message.
  }
  throw Exception('No search results');
}
