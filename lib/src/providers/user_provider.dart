import 'package:triva_app/src/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider {
  String _token = '';
  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String nombre, String telefono) async {
    String url = 'http://panceapp.appscrcali.online/register';

    final Map<String, String> body = {
      "email": email,
      "nombre": nombre,
      "telefono": telefono
    };

    final respuesta = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    Map<String, dynamic> respuestaMap = json.decode(respuesta.body);
    return respuestaMap;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    String url = 'http://panceapp.appscrcali.online/login';

    final Map<String, String> body = {"email": email, "password": password};

    final Map<String, dynamic> respuestaMap = {};

    final respuesta = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (respuesta.statusCode == 200) {
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["token"] = json.decode(respuesta.body)["token"];
      _prefs.token = json.decode(respuesta.body)["token"];
    } else {
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["message"] = json.decode(respuesta.body)["message"];
    }

    return respuestaMap;
  }

  Future<Map<String, dynamic>> recuperarContrasenna(String email) async {
    String url = 'http://panceapp.appscrcali.online/password/reset/request';

    final Map<String, String> body = {"email": email};

    final respuesta = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    final Map<String, dynamic> respuestaMap = {};

    if (respuesta.statusCode == 200) {
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["message"] = json.decode(respuesta.body)["message"];
    } else {
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["message"] = json.decode(respuesta.body)["error"];
    }

    return respuestaMap;
  }

  Future<Map<String, dynamic>> recuperarContrasennaToken(
      String token, String contrasenna1, String contrasenna2) async {
    String url = 'http://panceapp.appscrcali.online/password/reset/confirm';

    final Map<String, dynamic> body = {
      "token": token,
      "plainPassword": {"first": contrasenna1, "second": contrasenna2}
    };

    final respuesta = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    final Map<String, dynamic> respuestaMap = {};

    final Map respDecoded = json.decode(respuesta.body);

    if (respuesta.statusCode == 200) {
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["message"] = json.decode(respuesta.body)["message"];
    } else if (respuesta.statusCode == 404){
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["message"] = json.decode(respuesta.body)["error"];
    } else if (respDecoded.containsKey('children')){
      respuestaMap["code"] = 400;
      respuestaMap["message"] = 'Es posible que las contraseñas no coincidan';
    } else if (respuesta.statusCode == 400){
      respuestaMap["code"] = respuesta.statusCode;
      respuestaMap["message"] = json.decode(respuesta.body)["error"];
    } else {
      respuestaMap["code"] = 400;
      respuestaMap["message"] = 'Ha ocurrido un error';
    }

    return respuestaMap;
  }
}
