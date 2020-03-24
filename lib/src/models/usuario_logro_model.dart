// To parse this JSON data, do
//
//     final usuarioLogro = usuarioLogroFromJson(jsonString);

import 'dart:convert';

UsuarioLogro usuarioLogroFromJson(String str) => UsuarioLogro.fromJson(json.decode(str));

String usuarioLogroToJson(UsuarioLogro data) => json.encode(data.toJson());

class UsuarioLogro {
    String id;
    String usuarioId;
    String logroId;

    UsuarioLogro({
        this.id,
        this.usuarioId,
        this.logroId,
    });

    factory UsuarioLogro.fromJson(Map<String, dynamic> json) => UsuarioLogro(
        id: json["id"],
        usuarioId: json["usuario_id"],
        logroId: json["logro_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuario_id": usuarioId,
        "logro_id": logroId,
    };
}