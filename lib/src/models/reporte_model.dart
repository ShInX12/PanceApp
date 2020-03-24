// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'dart:convert';

Reporte reportFromJson(String str) => Reporte.fromJson(json.decode(str));

String reportToJson(Reporte data) => json.encode(data.toJson());

class Reporte {
    String id;
    String latitud;
    bool longitud;
    String fotoUrl;
    String tipoReporteId;
    String observacion;
    String fecha;
    String usuarioId;

    Reporte({
        this.id,
        this.latitud,
        this.longitud,
        this.fotoUrl,
        this.tipoReporteId,
        this.observacion,
        this.fecha,
        this.usuarioId,
    });

    factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
        id: json["id"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        fotoUrl: json["foto_url"],
        tipoReporteId: json["tipo_reporte_id"],
        observacion: json["observacion"],
        fecha: json["fecha"],
        usuarioId: json["usuario_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitud": latitud,
        "longitud": longitud,
        "foto_url": fotoUrl,
        "tipo_reporte_id": tipoReporteId,
        "observacion": observacion,
        "fecha": fecha,
        "usuario_id": usuarioId,
    };
}
