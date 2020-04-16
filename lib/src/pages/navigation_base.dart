import 'package:flutter/material.dart';
import 'package:triva_app/src/pages/game_page.dart';
import 'package:triva_app/src/pages/home_page.dart';
import 'package:triva_app/src/pages/map_page.dart';
import 'package:triva_app/src/preferences/user_preferences.dart';

class NavigationBase extends StatefulWidget {
  @override
  _NavigationBaseState createState() => _NavigationBaseState();
}

class _NavigationBaseState extends State<NavigationBase> {
  final prefs = new UserPreferences();
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
      drawer: _drawer(),
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

  Widget _drawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Bienvenido'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Cerrar sesión'),
            leading: Icon(Icons.close),
            onTap: () {
              prefs.token = '';
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
