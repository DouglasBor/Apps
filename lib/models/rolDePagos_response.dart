import 'dart:convert';

import 'package:enroll_app/models/index.dart';

class RolDePagosResponse {
  RolDePagosResponse({
    required this.succeeded,
    this.message,
    required this.statusCode,
    required this.errors,
    this.data,
  });

  bool succeeded;
  dynamic message;
  String statusCode;
  Errors errors;
  RolDePago? data;

  factory RolDePagosResponse.fromJson(String str) =>
      RolDePagosResponse.fromMap(json.decode(str));

  factory RolDePagosResponse.fromMap(Map<String, dynamic> json) =>
      RolDePagosResponse(
        succeeded: json["succeeded"],
        message: json["message"],
        statusCode: json["statusCode"].toString(),
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] != null ? RolDePago.fromJson(json["data"]) : null,
      );
}