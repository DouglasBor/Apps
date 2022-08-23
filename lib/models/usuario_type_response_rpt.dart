// To parse this JSON data, do
//
//     final clientTypeResponse = clientTypeResponseFromMap(jsonString);

import 'dart:convert';

import 'package:enroll_app/models/index.dart';

class UsuarioTypeResponseRpt {
    UsuarioTypeResponseRpt({
      required this.succeeded,
      required this.message,
      required this.statusCode,
      required this.errors,
      required this.data,
    });

    bool succeeded;
    String message;
    String statusCode;
    Errors errors;
    ClienteType data;//este tipo de dato va a cambiar

    factory UsuarioTypeResponseRpt.fromJson(String str) => UsuarioTypeResponseRpt.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioTypeResponseRpt.fromMap(Map<String, dynamic> json) => UsuarioTypeResponseRpt(
        succeeded: json["succeeded"],
        message: json["message"] ?? '',
        statusCode: json["statusCode"],
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] == null ? ClienteType() : ClienteType.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors.toMap(),
        "data": data,
    };
}
