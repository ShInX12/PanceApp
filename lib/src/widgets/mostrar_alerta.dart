import 'package:flutter/material.dart';

void mostrarALerta(BuildContext context, String titulo, String mensaje){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
} 