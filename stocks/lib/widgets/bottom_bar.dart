import 'package:flutter/material.dart';
import 'package:stocks/screens/home_screen.dart';
import 'package:stocks/screens/watchlist_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedPageIndex = 0;
  final List<Widget> screens = [const HomeScreen(), const WatchListScreen()];

  void tapFunc(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: tapFunc,
          currentIndex: _selectedPageIndex,
          elevation: 0.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_sharp), label: 'Watchlist')
          ]),
    );
  }
}
