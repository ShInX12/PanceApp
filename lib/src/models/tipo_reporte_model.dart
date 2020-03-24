// To parse this JSON data, do
//
//     final tipoReporte = tipoReporteFromJson(jsonString);

import 'dart:convert';

TipoReporte tipoReporteFromJson(String str) => TipoReporte.fromJson(json.decode(str));

String tipoReporteToJson(TipoReporte data) => json.encode(data.toJson());

class TipoReporte {
    String id;
    String nombre;

    TipoReporte({
        this.id,
        this.nombre,
    });

    factory TipoReporte.fromJson(Map<String, dynamic> json) => TipoReporte(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}
