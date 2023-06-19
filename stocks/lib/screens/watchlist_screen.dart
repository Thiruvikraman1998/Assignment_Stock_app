import 'package:flutter/material.dart';
import 'package:stocks/widgets/watchlist_tIle.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List comps = ['IBM', 'TCS', 'Reliance', 'Apple', 'Google', 'Wipro'];
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

            // list header column
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: size.height * 0.04,
              color: const Color(0xFF2F3044),
              child: const Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      WatchlistTile(
                        compname: comps[index],
                      ),
                      const Divider(
                        thickness: 0.2,
                        indent: 13,
                        endIndent: 15,
                      )
                    ],
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
