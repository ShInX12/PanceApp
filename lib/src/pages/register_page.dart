import 'package:flutter/material.dart';
import 'package:triva_app/src/providers/user_provider.dart';
import 'package:triva_app/src/widgets/form_widget.dart';
import 'package:triva_app/src/widgets/mostrar_alerta.dart';

class RegisterPage extends StatefulWidget {
  static final routeName = 'register';
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userProvider = new UserProvider();

  String nombre = "";
  String telefono = "";
  String email = "";

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
              _nameText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              _phoneText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              _emailText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
              _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameText() {
    return FormWidget(
      titulo: "Nombre",
      onChanged: (val) => nombre = val,
      icon: Icon(Icons.people, color: Colors.green),
      textInputType: TextInputType.text,
    );
  }

  Widget _phoneText() {
    return FormWidget(
      titulo: "Teléfono",
      onChanged: (val) => telefono = val,
      icon: Icon(Icons.phone, color: Colors.green),
      textInputType: TextInputType.phone,
    );
  }

  Widget _emailText() {
    return FormWidget(
      titulo: "Correo Electrónico",
      subTitle: "ejemplo@correo.com",
      onChanged: (val) => email = val,
      icon: Icon(Icons.email, color: Colors.green),
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _registerButton() {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      child: Container(
        width: size.width * 0.9,
        height: 55.0,
        child: Center(child: Text('Registrarse')),
      ),
      shape: StadiumBorder(),
      elevation: 1.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () => _registrarUsuario(email, nombre, telefono),
    );
  }

  _registrarUsuario(String email, String nombre, String telefono) async {
    Map respuesta = await userProvider.nuevoUsuario(email, nombre, telefono);

    if (respuesta.containsKey('id')) {
      mostrarALerta(context, 'Usuario registrado correctamente',
          'se ha enviado la contraseña a tu correo electrónico para que puedas iniciar sesión');
    } else if (respuesta.containsKey('error')) {
      mostrarALerta(context, 'Vuelve a intentarlo', respuesta['error']);
    } else {
      mostrarALerta(context, 'Vuelve a intentarlo',
          'Es probable que el correo ya esté registrado');
    }
  }
}
