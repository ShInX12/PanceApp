import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String titulo;
  final String subTitle;
  final Icon icon;
  final TextInputType textInputType;
  final Function onChanged;

  FormWidget({this.titulo, this.subTitle, this.onChanged, this.icon, this.textInputType});

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
          return "Los campos no pueden estar vacíos";
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      onChanged: onChanged,
    );
  }
}
