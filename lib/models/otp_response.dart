import 'dart:convert';
import 'package:enroll_app/models/index.dart';

class OtpResponse {
    OtpResponse({
      required this.succeeded,
      this.message,
      required this.statusCode,
      required this.errors,
      required this.data,
    });

    bool succeeded;
    dynamic message;
    String statusCode;
    Errors errors;
    String data;

    factory OtpResponse.fromJson(String str) => OtpResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OtpResponse.fromMap(Map<String, dynamic> json) => OtpResponse(
        succeeded: json["succeeded"].toString() == 'true',
        message: json["message"],
        statusCode: json["statusCode"].toString(),
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors.toMap(),
        "data": data,
    };
}

