import 'package:flutter/material.dart';
import 'package:triva_app/src/widgets/card_widget.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bar(),
      body: _gameList(),
    );
  }

  Widget _bar() {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 2.0,
      title: Text('¡Diviertete!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      centerTitle: true,
    );
  }

  Widget _gameList() {
    return ListView(
      children: <Widget>[
        CardWidget(
          title: "Trivia",
          image: AssetImage('assets/img/game-1.jpg'),
          page: "trivia_page",
        ),
        CardWidget(
          title: "Separa la basura",
          image: AssetImage('assets/img/game-2.jpg'),
          page: "arrastrar_page",
        ),
        CardWidget(
          title: "Rompecabezas",
          image: AssetImage('assets/img/game-3.jpg'),
          page: "rompecabezas_page",
        ),
      ],
    );
  }
}
