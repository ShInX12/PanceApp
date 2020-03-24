// import 'package:ecommerce_ecom/src/providers/usuario/user_provider.dart';
// import 'package:ecommerce_ecom/src/shared_preferences/user_preferences.dart';
// import 'package:ecommerce_ecom/src/utils/utils.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce_ecom/src/blocs/usuarios/login_bloc.dart';
// import 'package:ecommerce_ecom/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = 'login';
  // final userProvider = new UserProvider();
  // final prefs = UserPreference();
  @override
  Widget build(BuildContext context) {
    // prefs.lastPage = routeName;
    // prefs.pry = "ecomexpress";
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    // final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(child: Container()),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.07),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                    // padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: 100.0,
                    height: 100.0,
                    child: Text('Bienvenido a Pance App')),
                SizedBox(height: 30.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBoton(context),
                SizedBox(height: 20.0),
                FlatButton(
                  onPressed: () => {},
                  child: Text('¿Olvidó la contraseña?'),
                ),
                FlatButton(
                  onPressed: () => Navigator.pushNamed(context, 'register'),
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.green),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo Electrónico',
        ),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: Colors.green),
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: StadiumBorder(),
      elevation: 0.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'base');
      },
    );
  }

  // _login(BuildContext context, LoginBloc bloc) async {
  //   Map info = await userProvider.login(bloc.email, bloc.password);

  //   if (info['ok']) {
  //     Navigator.pushReplacementNamed(context, 'base');
  //   } else {
  //     showAlert(context, info['mensaje'], "1");
  //   }
  // }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(73, 155, 234, 1.0),
            Color.fromRGBO(32, 124, 229, 1.0),
          ],
        ),
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: circulo,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: circulo,
        ),
        Positioned(
          bottom: -50.0,
          right: -10.0,
          child: circulo,
        ),
        // Container(
        //   child: SafeArea(
        //     child: Column(
        //       children: <Widget>[
        //         // Icono o imagen en la parte de arriba.
        //         // Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
        //         SizedBox(
        //           height: 10.0,
        //           width: double.infinity,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
