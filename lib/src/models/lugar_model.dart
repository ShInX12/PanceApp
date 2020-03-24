// To parse this JSON data, do
//
//     final lugar = lugarFromJson(jsonString);

import 'dart:convert';

Lugar lugarFromJson(String str) => Lugar.fromJson(json.decode(str));

String lugarToJson(Lugar data) => json.encode(data.toJson());

class Lugar {
    String id;
    String nombre;
    String descripcion;
    String longitud;
    String latitud;
    String fotoUrl;
    String mapaId;

    Lugar({
        this.id,
        this.nombre,
        this.descripcion,
        this.longitud,
        this.latitud,
        this.fotoUrl,
        this.mapaId,
    });

    factory Lugar.fromJson(Map<String, dynamic> json) => Lugar(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        longitud: json["longitud"],
        latitud: json["latitud"],
        fotoUrl: json["foto_url"],
        mapaId: json["mapa_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "longitud": longitud,
        "latitud": latitud,
        "foto_url": fotoUrl,
        "mapa_id": mapaId,
    };
}
