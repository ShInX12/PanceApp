// To parse this JSON data, do
//
//     final juego = juegoFromJson(jsonString);

import 'dart:convert';

Juego juegoFromJson(String str) => Juego.fromJson(json.decode(str));

String juegoToJson(Juego data) => json.encode(data.toJson());

class Juego {
    String id;
    String nombre;
    String descripcion;

    Juego({
        this.id,
        this.nombre,
        this.descripcion,
    });

    factory Juego.fromJson(Map<String, dynamic> json) => Juego(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
    };
}
