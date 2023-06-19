import 'package:flutter/material.dart';

class WishListTile extends StatelessWidget {
  final String compname;
  const WishListTile({super.key, required this.compname});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(compname),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete_forever_outlined),
      ),
    );
  }
}
