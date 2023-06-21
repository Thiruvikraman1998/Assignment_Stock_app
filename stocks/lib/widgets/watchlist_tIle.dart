import 'package:flutter/material.dart';
import 'package:stocks/models/company_info.dart';

class WatchlistTile extends StatelessWidget {
  final CompanyInfo companyInfo;
  final Function deleteitem;
  const WatchlistTile(
      {super.key, required this.companyInfo, required this.deleteitem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        companyInfo.compSymbol!,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        companyInfo.compName!,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: SizedBox(
        width: 150,
        child: Row(
          children: [
            const Text('price'),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_forever_outlined,
                  color: Color(0xFFAD4C41)),
            )
          ],
        ),
      ),
    );
  }
}
