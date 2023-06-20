import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocks/utils/constants.dart';

import '../models/search_results_model.dart';

Future<SearchResults> fetchSearchResults() async {
  try {
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return SearchResults.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  throw Exception('No search results');
}
