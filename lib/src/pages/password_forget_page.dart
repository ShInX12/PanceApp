import 'package:flutter/material.dart';
import 'package:triva_app/src/providers/user_provider.dart';
import 'package:triva_app/src/widgets/mostrar_alerta.dart';

class PasswordForget extends StatefulWidget {
  @override
  _PasswordForgetState createState() => _PasswordForgetState();
}

class _PasswordForgetState extends State<PasswordForget> {
  String email;
  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Recuperar contraseña'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              _instrucciones(),
              SizedBox(height: 40.0),
              _inputEmail(),
              SizedBox(height: 40.0),
              _crearBotonEnviar(context),
              SizedBox(height: 40.0),
              _crearBotonCambiar(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _instrucciones() {
    return Text(
        'Te enviaremos un token al correo para que puedas iniciar sesión');
  }

  Widget _inputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.alternate_email, color: Colors.green),
        hintText: 'ejemplo@correo.com',
        labelText: 'Correo Electrónico',
      ),
      onChanged: (val) => email = val,
    );
  }

  Widget _crearBotonEnviar(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      child: Container(
        width: size.width * 0.9,
        height: 55.0,
        child: Center(child: Text('Enviar token')),
      ),
      shape: StadiumBorder(),
      elevation: 1.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () => _recuperarContrasenna(context, email),
    );
  }

  Widget _crearBotonCambiar(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pushNamed(context, 'password_token'),
      child: Text('Ya tengo el token'),
    );
  }

  _recuperarContrasenna(BuildContext context, String email) async {
    Map respuesta = await userProvider.recuperarContrasenna(email);

    if (respuesta["code"] == 200) {
      mostrarALerta(context, 'Solicitud realizada', respuesta["message"]);
    } else {
      mostrarALerta(context, 'Vuelve a intentarlo', respuesta["message"]);
    }
  }
}
