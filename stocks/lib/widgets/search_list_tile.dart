import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text('Company Name'),
        subtitle: const Text('Symbol'),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)));
  }
}
