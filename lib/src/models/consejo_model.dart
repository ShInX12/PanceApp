// To parse this JSON data, do
//
//     final consejo = consejoFromJson(jsonString);

import 'dart:convert';

Consejo consejoFromJson(String str) => Consejo.fromJson(json.decode(str));

String consejoToJson(Consejo data) => json.encode(data.toJson());

class Consejo {
    String id;
    String nombre;
    String descripcion;

    Consejo({
        this.id,
        this.nombre,
        this.descripcion,
    });

    factory Consejo.fromJson(Map<String, dynamic> json) => Consejo(
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
