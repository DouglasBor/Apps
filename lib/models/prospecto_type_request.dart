// To parse this JSON data, do
//
//     final clientRequest = clientRequestFromMap(jsonString);

import 'dart:convert';

class ProspectoRequest {
    ProspectoRequest({
      required this.tipoIdentificacion,
      required this.identificacion,
      required this.fechaNacimiento,
      required this.genero,
      required this.direccion,
      required this.latitud,
      required this.longitud,
      required this.correo,
      required this.password,
    });

    String tipoIdentificacion;
    String identificacion;
    DateTime fechaNacimiento;
    String genero;
    String direccion;
    int latitud;
    int longitud;
    String correo;
    String password;

    factory ProspectoRequest.fromJson(String str) => ProspectoRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProspectoRequest.fromMap(Map<String, dynamic> json) => ProspectoRequest(
        tipoIdentificacion: json["tipoIdentificacion"],
        identificacion: json["identificacion"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        genero: json["genero"],
        direccion: json["direccion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        correo: json["correo"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "tipoIdentificacion": tipoIdentificacion,
        "identificacion": identificacion,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "genero": genero,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "correo": correo,
        "password": password,
    };
}
