import 'package:flutter/material.dart';
import 'package:stocks/models/company_info.dart';

class WatchlistTile extends StatefulWidget {
  final CompanyInfo companyInfo;
  final double companyPrice;
  //final Future<StockData?> stockPrice;

  const WatchlistTile(
      {super.key, required this.companyInfo, required this.companyPrice});

  @override
  State<WatchlistTile> createState() => _WatchlistTileState();
}

class _WatchlistTileState extends State<WatchlistTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.companyInfo.compSymbol!,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        widget.companyInfo.compName!,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: SizedBox(
        width: 130,
        child: Row(
          children: [
            Text(
              "\$ ${widget.companyPrice.toString()}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                deleteWatchListFromSearch(widget.companyInfo);
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Color(0xFFAD4C41),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteWatchListFromSearch(CompanyInfo companyInfo) async {
    companyInfo.delete();
  }
}
