import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/models/hive_boxes.dart';
import 'package:stocks/models/intraday_model.dart';
import 'package:stocks/widgets/watchlist_tIle.dart';

import '../functions/intraday_price_fetch.dart';
import '../models/company_info.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2C2E3B),
      appBar: AppBar(
        backgroundColor: const Color(0xff2C2E3B),
        title: const Text(
          'Watchlist',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Added list of watchlist items
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: HiveBox.getCompanyInfo().listenable(),
                builder: (context, box, child) {
                  final companyinfo = box.values.toList().cast<CompanyInfo>();
                  return ListView.builder(
                    itemCount: companyinfo.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: fetchStockData(companyinfo[index].compSymbol!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final price =
                                snapshot.data!.timeSeries.values.first.close;
                            return Column(
                              children: [
                                WatchlistTile(
                                  companyInfo: companyinfo[index],
                                  companyPrice: price,
                                ),
                                const Divider(
                                  thickness: 0.2,
                                  indent: 13,
                                  endIndent: 15,
                                )
                              ],
                            );
                          }
                          return const Text('0.00');
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
