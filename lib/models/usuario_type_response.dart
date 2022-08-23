// To parse this JSON data, do
//
//     final clientTypeResponse = clientTypeResponseFromMap(jsonString);

import 'dart:convert';

import 'package:enroll_app/models/index.dart';

class UsuarioTypeResponse {
    UsuarioTypeResponse({
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
    UsuarioType data;//este tipo de dato va a cambiar

    factory UsuarioTypeResponse.fromJson(String str) => UsuarioTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioTypeResponse.fromMap(Map<String, dynamic> json) => UsuarioTypeResponse(
        succeeded: json["succeeded"],
        message: json["message"] ?? '',
        statusCode: json["statusCode"],
        errors: Errors.fromMap(json["errors"]),
        data: UsuarioType.fromMap(json["data"]),//json["data"],
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors.toMap(),
        "data": data,
    };
}
