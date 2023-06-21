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
  late Future<List<CompanyInfo>> stockPrice;
  @override
  void initState() {
    stockPrice = _makeApiCall();
    debugPrint("page changed");
    super.initState();
  }

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
            // Sort button to sort the watch list items.
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    'Sort',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.sort_rounded)
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Added list of watchlist items
            Expanded(
              child: FutureBuilder(
                future: _makeApiCall(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    return ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            WatchlistTile(
                                companyInfo: data![index], deleteitem: () {}),
                            const Divider(
                              thickness: 0.2,
                              indent: 13,
                              endIndent: 15,
                            )
                          ],
                        );
                      },
                    );
                  }
                  return Text("SOme text");
                },
              ),
              // child: ValueListenableBuilder(
              //   valueListenable: HiveBox.getCompanyInfo().listenable(),
              //   builder: (context, box, child) {
              //     final companyinfo = box.values.toList().cast<CompanyInfo>();
              //     return ListView.builder(
              //       itemCount: companyinfo.length,
              //       itemBuilder: (context, index) {
              //         return Column(
              //           children: [
              //             WatchlistTile(
              //                 companyInfo: companyinfo[index]
              //                 ,price: ,
              //                 deleteitem: () {}),
              //             const Divider(
              //               thickness: 0.2,
              //               indent: 13,
              //               endIndent: 15,
              //             )
              //           ],
              //         );
              //       },
              //     );
              //   },
              // ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<CompanyInfo>> _makeApiCall() async {
    List<CompanyInfo> info = [];
    var watchlist = HiveBox.getCompanyInfo().values.toList();
    var responses = await Future.wait(watchlist.map((e) {
      return fetchStockData(e.compSymbol!);
    }).toList());

    for (int i = 0; i < watchlist.length; i++) {
      info.add(
        CompanyInfo(
          compName: watchlist[i].compName,
          compSymbol: watchlist[i].compSymbol,
          price: responses[i]?.timeSeries.values.first.close.toString(),
        ),
      );
    }
    return info;
  }
}
