import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/company_info.dart';
import 'widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CompanyInfoAdapter());
  await Hive.openBox<CompanyInfo>('company_info');

  // final pathDirectory = await getApplicationSupportDirectory();
  // Hive.init(pathDirectory.path);
  //
  //
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
