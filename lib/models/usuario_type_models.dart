
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UsuarioType {
  int codigoEmpleado;
  String tipoIdentificacion;
  String identificacion;
  String nombres;
  String apellidos;
  String empresa;
  String cargo;
  String fechaIngreso;
  String area;
  String rucEmpresa;
  String grupoEmpresarial;
  String correo;
  double sueldo;
  String tipoContrato;

  UsuarioType({
    required this.codigoEmpleado,
    required this.tipoIdentificacion,
    required this.identificacion,
    required this.nombres,
    required this.apellidos,
    required this.empresa,
    required this.cargo,
    required this.fechaIngreso,
    required this.area,
    required this.rucEmpresa,
    required this.grupoEmpresarial,
    required this.correo,
    required this.sueldo,
    required this.tipoContrato,
  });

  factory UsuarioType.fromJson(String str) => UsuarioType.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioType.fromMap(Map<String, dynamic> json) => UsuarioType(
        codigoEmpleado: json["codigoEmpleado"],
        tipoIdentificacion: json["tipoIdentificacion"],
        identificacion: json["identificacion"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        empresa: json["empresa"],
        cargo: json["cargo"],
        fechaIngreso: json["fechaIngreso"] ?? '',//DateTime.parse(json["fechaIngreso"]),
        area: json["area"],
        rucEmpresa: json["rucEmpresa"],
        grupoEmpresarial: json["grupoEmpresarial"],
        correo: json["correo"],
        sueldo: json["sueldo"],
        tipoContrato: json["tipoContrato"],
    );

    Map<String, dynamic> toMap() => {
        "codigoEmpleado": codigoEmpleado,
        "tipoIdentificacion": tipoIdentificacion,
        "identificacion": identificacion,
        "nombres": nombres,
        "apellidos": apellidos,
        "empresa": empresa,
        "cargo": cargo,
        "fechaIngreso": fechaIngreso,//fechaIngreso.toIso8601String(),
        "area": area,
        "rucEmpresa": rucEmpresa,
        "grupoEmpresarial": grupoEmpresarial,
        "correo": correo,
        "sueldo": sueldo,
        "tipoContrato": tipoContrato,
    };
}