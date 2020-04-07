import 'package:flutter/material.dart';
import 'package:triva_app/src/pages/rompecabezas_page.dart';

class RompecabezasBase extends StatelessWidget {
  const RompecabezasBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Descubre la imagen'),
      ),
      body: RompecabezasPage( MediaQuery.of(context).size, 'assets/img/puzzle.jpg', 4),
    );
  }
}
