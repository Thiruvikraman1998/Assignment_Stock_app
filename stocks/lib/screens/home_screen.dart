import 'package:flutter/material.dart';
import 'package:stocks/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trade Brains'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: const Column(
          children: [
            SearchField(),
          ],
        ),
      ),
    );
  }
}
