// To parse this JSON data, do
//
//     final progreso = progresoFromJson(jsonString);

import 'dart:convert';

Progreso progresoFromJson(String str) => Progreso.fromJson(json.decode(str));

String progresoToJson(Progreso data) => json.encode(data.toJson());

class Progreso {
    String id;
    String juegoId;
    bool nivel1;
    bool nivel2;
    bool nivel3;
    String userId;

    Progreso({
        this.id,
        this.juegoId,
        this.nivel1,
        this.nivel2,
        this.nivel3,
        this.userId,
    });

    factory Progreso.fromJson(Map<String, dynamic> json) => Progreso(
        id: json["id"],
        juegoId: json["juego_id"],
        nivel1: json["nivel_1"],
        nivel2: json["nivel_2"],
        nivel3: json["nivel_3"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "juego_id": juegoId,
        "nivel_1": nivel1,
        "nivel_2": nivel2,
        "nivel_3": nivel3,
        "user_id": userId,
    };
}
