import 'package:flutter/material.dart';
import 'package:triva_app/src/pages/arrastrar_page.dart';
import 'package:triva_app/src/pages/game_page.dart';
import 'package:triva_app/src/pages/home_page.dart';
import 'package:triva_app/src/pages/login_page.dart';
import 'package:triva_app/src/pages/map_page.dart';
import 'package:triva_app/src/pages/navigation_base.dart';
import 'package:triva_app/src/pages/register_page.dart';
import 'package:triva_app/src/pages/rompecabezas_base.dart';
import 'package:triva_app/src/pages/trivia_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pance App',
      initialRoute: 'login',
      routes: {
        'login'            : (BuildContext context) => LoginPage(),
        'register'         : (BuildContext context) => RegisterPage(),
        'base'             : (BuildContext context) => NavigationBase(),
        'home'             : (BuildContext context) => HomePage(),
        'games'            : (BuildContext context) => GamePage(),
        'map'              : (BuildContext context) => MapPage(),
        'trivia_page'      : (BuildContext context) => TriviaPage(),
        'arrastrar_page'   : (BuildContext context) => ArrastrarPage(),
        'rompecabezas_base': (BuildContext context) => RompecabezasBase(),
      },
    );
  }
}
