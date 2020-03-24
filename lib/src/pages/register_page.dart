import 'package:flutter/material.dart';
import 'package:triva_app/src/widgets/form_widget.dart';

class RegisterPage extends StatefulWidget {
  static final routeName = 'register';
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "";
  String name = "";
  String document = "";
  String telefono = "";
  String direccion = "";
  String password = "";
  String project;
  String documentType;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Registro',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black54,
            fontFamily: "Gotik",
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF6991C7),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Padding( padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),),
              _nameText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              _phoneText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              _emailText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              _passwordText(),
              Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
              _registerButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameText() {
    return FormWidget(
      titulo: "Nombre",
      subTitle: "",
      onChanged: (val) => name = val,
      icon: Icon(Icons.people, color: Colors.green),
    );
  }

  Widget _phoneText() {
    return FormWidget(
      titulo: "Teléfono",
      subTitle: "",
      onChanged: (val) => name = val,
      icon: Icon(Icons.phone, color: Colors.green),
    );
  }

  Widget _emailText() {
    return FormWidget(
      titulo: "Correo Electrónico",
      subTitle: "preaba@example",
      onChanged: (val) => email = val,
      icon: Icon(Icons.email, color: Colors.green),
    );
  }

  Widget _passwordText() {
    return FormWidget(
      titulo: "Contraseña",
      subTitle: "",
      onChanged: (val) => password = val,
      icon: Icon(Icons.lock, color: Colors.green),
    );
  }

  Widget _registerButton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
        child: Text('Registrarse'),
      ),
      shape: StadiumBorder(),
      elevation: 0.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () {
        print("Soy un $email");
      },
    );
  }
}
