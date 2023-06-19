import 'package:flutter/material.dart';

import 'widgets/bottom_bar.dart';

void main() {
  runApp(const StockApp());
}

class StockApp extends StatelessWidget {
  const StockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Stock App',
      home: const BottomBar(),
    );
  }
}
