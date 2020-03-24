// To parse this JSON data, do
//
//     final logro = logroFromJson(jsonString);

import 'dart:convert';

Logro logroFromJson(String str) => Logro.fromJson(json.decode(str));

String logroToJson(Logro data) => json.encode(data.toJson());

class Logro {
    String id;
    String nombre;
    bool descripcion;
    String juegoId;
    String lugarId;
    String tipoLogro;

    Logro({
        this.id,
        this.nombre,
        this.descripcion,
        this.juegoId,
        this.lugarId,
        this.tipoLogro,
    });

    factory Logro.fromJson(Map<String, dynamic> json) => Logro(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        juegoId: json["juego_id"],
        lugarId: json["lugar_id"],
        tipoLogro: json["tipo_logro"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "juego_id": juegoId,
        "lugar_id": lugarId,
        "tipo_logro": tipoLogro,
    };
}
