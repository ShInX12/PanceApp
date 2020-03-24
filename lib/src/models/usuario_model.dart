import 'dart:convert';

Usuario userFromJson(String str) => Usuario.fromJson(json.decode(str));

String userToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    String id;
    String email;
    bool enabled;
    String password;
    String lastLogin;
    String rol;
    String nombre;

    Usuario({
        this.id,
        this.email,
        this.enabled,
        this.password,
        this.lastLogin,
        this.rol,
        this.nombre,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        email: json["email"],
        enabled: json["enabled"],
        password: json["password"],
        lastLogin: json["last_login"],
        rol: json["rol"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "enabled": enabled,
        "password": password,
        "last_login": lastLogin,
        "rol": rol,
        "nombre": nombre,
    };
}