import 'package:flutter/material.dart';

class WishListTile extends StatelessWidget {
  final String compname;
  const WishListTile({super.key, required this.compname});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(compname),
        trailing: SizedBox(
          width: 150,
          child: Row(
            children: [
              const Text('price'),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_forever_outlined),
              )
            ],
          ),
        ));
  }
}