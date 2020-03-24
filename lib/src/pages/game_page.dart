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
          image: NetworkImage('https://lh3.googleusercontent.com/proxy/6cx373pXUDMdsS7cCkTC3LheWjuBfT_eZyD_Lwk0PxM78yJpxWQOv2SOYddcuGa83bU6RU5uaORgH13Am9NdijX7JDfA4pe7K5CHOhNK'),
          page: "rompecabezas_page",
        ),
      ],
    );
  }
}
