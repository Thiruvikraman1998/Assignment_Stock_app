import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocks/functions/search_api_fetch.dart';
import 'package:stocks/models/search_results_model.dart';
import 'package:stocks/widgets/search_list_tile.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final SearchController searchController = SearchController();

  Future<SearchResults>? search;
  // final Debouncer onSearchDebouncer =
  //     Debouncer(delay: const Duration(milliseconds: 1000));
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: size.height * 0.07,
          child: SearchBar(
            //elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            leading: const Icon(Icons.search_rounded),
            controller: searchController,
            hintText: 'Search...',
            onChanged: (value) {
              setState(() {
                search = fetchSearchResults(value);
              });
            },
          ),
        ),
        Expanded(
            child: FutureBuilder<SearchResults>(
          future: search,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            } else if (snapshot.hasData) {
              final result = snapshot.data?.bestMatches;
              return ListView.builder(
                itemCount: result?.length ?? 0,
                itemBuilder: (context, index) {
                  if ((result?.length ?? 0) > 0) {
                    return SearchListTile(results: result![index]);
                  } else {
                    return const Center(
                      child: Text("No result"),
                    );
                  }
                },
              );
            } else if (!snapshot.hasData) {
              const Center(child: Text("Type something to search"));
            }
            return const Text('');
          },
        ))
      ],
    );
  }
}
