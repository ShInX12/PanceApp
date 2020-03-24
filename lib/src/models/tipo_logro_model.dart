// To parse this JSON data, do
//
//     final tipoLogro = tipoLogroFromJson(jsonString);

import 'dart:convert';

TipoLogro tipoLogroFromJson(String str) => TipoLogro.fromJson(json.decode(str));

String tipoLogroToJson(TipoLogro data) => json.encode(data.toJson());

class TipoLogro {
    String id;
    String nombre;

    TipoLogro({
        this.id,
        this.nombre,
    });

    factory TipoLogro.fromJson(Map<String, dynamic> json) => TipoLogro(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
