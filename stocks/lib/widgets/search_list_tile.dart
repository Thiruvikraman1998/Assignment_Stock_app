import 'package:flutter/material.dart';
import 'package:stocks/models/search_results_model.dart';

class SearchListTile extends StatelessWidget {
  final BestMatches results;
  const SearchListTile({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(results.symbol!),
          subtitle: Text(results.name!),
          trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
        const Divider(
          indent: 15,
          endIndent: 20,
        )
      ],
    );
  }
}
