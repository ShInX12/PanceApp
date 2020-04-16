import 'package:flutter/material.dart';
import 'package:triva_app/src/providers/user_provider.dart';
import 'package:triva_app/src/widgets/mostrar_alerta.dart';

class PasswordToken extends StatefulWidget {
  @override
  _PasswordTokenState createState() => _PasswordTokenState();
}

class _PasswordTokenState extends State<PasswordToken> {
  final userProvider = new UserProvider();
  String token;
  String password1;
  String password2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Ingresa el token'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              _inputToken(),
              SizedBox(height: 40.0),
              _inputPassword1(),
              SizedBox(height: 40.0),
              _inputPassword2(),
              SizedBox(height: 40.0),
              _crearBotonCambiar(context),
              SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputToken() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.send, color: Colors.green),
        labelText: 'Token',
      ),
      onChanged: (val) => token = val,
    );
  }

  Widget _inputPassword1() {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.green),
        labelText: 'Contraseña',
      ),
      onChanged: (val) => password1 = val,
    );
  }

  Widget _inputPassword2() {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.green),
        labelText: 'Confirma contraseña',
      ),
      onChanged: (val) => password2 = val,
    );
  }

  Widget _crearBotonCambiar(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      child: Container(
        width: size.width * 0.9,
        height: 55.0,
        child: Center(child: Text('Cambiar contraseña')),
      ),
      shape: StadiumBorder(),
      elevation: 1.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () =>
          _cambiarContrasennaToken(context, token, password1, password2),
    );
  }

  _cambiarContrasennaToken(BuildContext context, String token, String password1,
      String password2) async {
    Map respuesta = await userProvider.recuperarContrasennaToken(
        token, password1, password2);

    if (respuesta["code"] == 200) {
      mostrarALerta(context, 'Contraseña cambiada', respuesta["message"]);
    } else {
      mostrarALerta(context, 'Vuelve a intentarlo', respuesta["message"]);
    }
  }
}
