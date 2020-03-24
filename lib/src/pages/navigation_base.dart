import 'package:flutter/material.dart';
import 'package:triva_app/src/pages/game_page.dart';
import 'package:triva_app/src/pages/home_page.dart';
import 'package:triva_app/src/pages/map_page.dart';

class NavigationBase extends StatefulWidget {
  @override
  _NavigationBaseState createState() => _NavigationBaseState();
}

class _NavigationBaseState extends State<NavigationBase> {
  int _selectedPage = 0;

  final _pageOptions = [
    HomePage(),
    GamePage(),
    MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: _navigation(),
    );
  }

  Widget _navigation() {
    return BottomNavigationBar(
      elevation: 20.0,
      currentIndex: _selectedPage,
      selectedItemColor: Colors.green,
      onTap: (int index) => setState(() {
        _selectedPage = index;
      }),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30.0),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.games, size: 30.0),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map, size: 30.0),
          title: Container(),
        ),
      ],
    );
  }
}
