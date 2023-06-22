import 'package:flutter/material.dart';
import 'package:stocks/models/company_info.dart';

class WatchlistTile extends StatelessWidget {
  final CompanyInfo companyInfo;
  final double? companyPrice;
  //final Future<StockData?> stockPrice;

  const WatchlistTile(
      {super.key, required this.companyInfo, required this.companyPrice});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        companyInfo.compSymbol!,
      ),
      subtitle: Text(
        companyInfo.compName!,
      ),
      trailing: SizedBox(
        width: 130,
        child: Row(
          children: [
            Text(
              "\$ ${companyPrice.toString()}",
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                deleteWatchListFromSearch(companyInfo);
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
