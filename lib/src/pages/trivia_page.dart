import 'package:flutter/material.dart';

class TriviaPage extends StatefulWidget {
  @override
  _TriviaPageState createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  int _respuestaPregunta1 = 0;
  int _respuestaPregunta2 = 0;
  int _respuestaPregunta3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          _pregunta1(
              "Pregunta 1", "Árbol de la ciudad de Cali que se caracteriza por tener sus flores rosadas o amarillas", "Ceiba", "Guayacan", "Gualanday", 2),
          Divider(),
          _pregunta2(
              "Pregunta 2", "¿Cúantos ríos atraviesan la ciudad de Cali?", "Siete", "Diez", "Cinco", 1),
          Divider(),
          _pregunta3(
              "Pregunta 3", "¿En qué año fue fundada la ciudad de Cali?", "1545", "1626", "1536", 3),
          Divider(),
          _botonComprobarRespuestas(),
        ],
      ),
    );
  }

  Widget _pregunta1(String titulo, String pregunta, String respuesta1,
      String respuesta2, String respuesta3, int correcto) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(titulo, style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(pregunta),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: _respuestaPregunta1,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta1 = value;
                });
              },
            ),
            title: Text(respuesta1),
          ),
          ListTile(
            leading: Radio(
              value: 2,
              groupValue: _respuestaPregunta1,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta1 = value;
                });
              },
            ),
            title: Text(respuesta2),
          ),
          ListTile(
            leading: Radio(
              value: 3,
              groupValue: _respuestaPregunta1,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta1 = value;
                });
              },
            ),
            title: Text(respuesta3),
          ),
        ],
      ),
    );
  }

  Widget _pregunta2(String titulo, String pregunta, String respuesta1,
      String respuesta2, String respuesta3, int correcto) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(titulo, style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(pregunta),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: _respuestaPregunta2,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta2 = value;
                });
              },
            ),
            title: Text(respuesta1),
          ),
          ListTile(
            leading: Radio(
              value: 2,
              groupValue: _respuestaPregunta2,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta2 = value;
                });
              },
            ),
            title: Text(respuesta2),
          ),
          ListTile(
            leading: Radio(
              value: 3,
              groupValue: _respuestaPregunta2,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta2 = value;
                });
              },
            ),
            title: Text(respuesta3),
          ),
        ],
      ),
    );
  }

  Widget _pregunta3(String titulo, String pregunta, String respuesta1,
      String respuesta2, String respuesta3, int correcto) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(titulo, style: new TextStyle(fontWeight: FontWeight.bold)),
          Text(pregunta),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: _respuestaPregunta3,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta3 = value;
                });
              },
            ),
            title: Text(respuesta1),
          ),
          ListTile(
            leading: Radio(
              value: 2,
              groupValue: _respuestaPregunta3,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta3 = value;
                });
              },
            ),
            title: Text(respuesta2),
          ),
          ListTile(
            leading: Radio(
              value: 3,
              groupValue: _respuestaPregunta3,
              onChanged: (value) {
                setState(() {
                  _respuestaPregunta3 = value;
                });
              },
            ),
            title: Text(respuesta3),
          ),
        ],
      ),
    );
  }

  Widget _botonComprobarRespuestas() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      height: 50.0,
      child: RaisedButton(
        shape: StadiumBorder(),
        elevation: 1.0,
        color: Colors.green,
        textColor: Colors.white,
        child: Text("Comprobar"),
        onPressed: () {
          _comprobarRespuestas();
        },
      ),
    );
  }

  _comprobarRespuestas(){
    if (_respuestaPregunta1 == 2 && _respuestaPregunta2 == 1 && _respuestaPregunta3 == 3){
      _mostrarAlert(context, "¡Felicidades!", "Tus respuestas son correctas ;)");
    } else {
      _mostrarAlert(context, "Oh no!", "Vuelve a intentarlo :s");
    }
  }

  void _mostrarAlert(BuildContext context, String titulo, String body){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(titulo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(body),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: (){Navigator.of(context).pop();},
            )
          ],
        );
      }
    );
  }
}
