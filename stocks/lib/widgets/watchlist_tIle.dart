import 'package:flutter/material.dart';

class WatchlistTile extends StatelessWidget {
  final String compname;
  const WatchlistTile({super.key, required this.compname});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          compname,
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
        ));
  }
}
