// To parse this JSON data, do
//
//     final mapa = mapaFromJson(jsonString);

import 'dart:convert';

Mapa mapaFromJson(String str) => Mapa.fromJson(json.decode(str));

String mapaToJson(Mapa data) => json.encode(data.toJson());

class Mapa {
    String id;
    String nombre;
    String longitud;
    String latitud;

    Mapa({
        this.id,
        this.nombre,
        this.longitud,
        this.latitud,
    });

    factory Mapa.fromJson(Map<String, dynamic> json) => Mapa(
        id: json["id"],
        nombre: json["nombre"],
        longitud: json["longitud"],
        latitud: json["latitud"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "longitud": longitud,
        "latitud": latitud,
    };
}