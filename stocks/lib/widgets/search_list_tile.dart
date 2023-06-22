import 'package:flutter/material.dart';
import 'package:stocks/models/company_info.dart';
import 'package:stocks/models/hive_boxes.dart';
import 'package:stocks/models/search_results_model.dart';

class SearchListTile extends StatefulWidget {
  final BestMatches results;
  const SearchListTile({super.key, required this.results});

  @override
  State<SearchListTile> createState() => _SearchListTileState();
}

class _SearchListTileState extends State<SearchListTile> {
  //late CompanyInfo compInfo;
  late String compName;
  late String compSymbol;
  bool isSelectedtapped = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.results.symbol!),
          subtitle: Text(widget.results.name!),
          trailing: IconButton(
            onPressed: () {
              compName = widget.results.name ??= 'null';
              compSymbol = widget.results.symbol ??= 'null';
              debugPrint(compName);
              addToWatchListFromSearch(compName, compSymbol);
              debugPrint(compSymbol);
              setState(() {
                isSelectedtapped = !isSelectedtapped;
              });
            },
            icon: isSelectedtapped
                ? const Icon(Icons.check)
                : const Icon(Icons.add),
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 20,
        )
      ],
    );
  }

  Future<void> addToWatchListFromSearch(
      String companyName, String companySymbol) async {
    final companyInfo = CompanyInfo()
      ..compName = companyName
      ..compSymbol = companySymbol;

    final box = HiveBox.getCompanyInfo();
    if (!box.values.contains(companyInfo)) {
      await box.add(companyInfo);
    }
  }
}
