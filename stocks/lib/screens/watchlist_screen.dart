import 'package:flutter/material.dart';
import 'package:stocks/widgets/wishlist_tIle.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List comps = ['IBM', 'TCS', 'Reliance', 'Apple', 'Google', 'Wipro'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
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
            Expanded(
              child: ListView.builder(
                itemCount: comps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      WishListTile(
                        compname: comps[index],
                      ),
                      const Divider(
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
