import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String titulo;
  final String subTitle;
  final Function onChanged;
  final Icon icon;

  FormWidget({this.titulo, this.subTitle, this.onChanged, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
        prefixIcon: icon,
        labelText: titulo,
        hintText: subTitle,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return "El correo no puede estar vacío";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(fontFamily: "Poppins"),
      onChanged: onChanged,
    );
  }
}
