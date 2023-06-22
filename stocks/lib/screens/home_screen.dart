import 'package:flutter/material.dart';
import 'package:stocks/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks Search'),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: const SearchField()),
    );
  }
}
