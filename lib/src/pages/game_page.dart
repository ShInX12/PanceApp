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
          image: NetworkImage('https://www.vivus.ge/axali-ambebi/wp-content/uploads/Quizzes1-1024x683.jpg'),
          page: "trivia_page",
        ),
        CardWidget(
          title: "Separa la basura",
          image: NetworkImage('https://www.sabermassantafe.com/wp-content/files_mf/153683602702113.jpg'),
          page: "arrastrar_page",
        ),
        CardWidget(
          title: "Rompecabezas",
          image: NetworkImage('https://images7.alphacoders.com/419/thumb-1920-419726.jpg'),
          page: "rompecabezas_page",
        ),
      ],
    );
  }
}
