import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/models/hive_boxes.dart';
import 'package:stocks/widgets/watchlist_tIle.dart';

import '../models/company_info.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

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
              child: ValueListenableBuilder(
                valueListenable: HiveBox.getCompanyInfo().listenable(),
                builder: (context, box, child) {
                  final companyinfo = box.values.toList().cast<CompanyInfo>();
                  return ListView.builder(
                    itemCount: companyinfo.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          WatchlistTile(
                              companyInfo: companyinfo[index],
                              deleteitem: () {}),
                          const Divider(
                            thickness: 0.2,
                            indent: 13,
                            endIndent: 15,
                          )
                        ],
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
