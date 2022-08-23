import 'dart:convert';

RolDePago rolDePagoFromJson(String str) => RolDePago.fromJson(json.decode(str));

String rolDePagoToJson(RolDePago data) => json.encode(data.toJson());

class RolDePago {
  RolDePago({
    this.cabeceraRol,
    this.observacion,
    this.totalIngresos,
    this.totalEgresos,
    this.netoPagar,
    this.listaIngresos,
    this.listaEgresos,
  });

  CabeceraRol? cabeceraRol = CabeceraRol();
  String? observacion;
  double? totalIngresos;
  double? totalEgresos;
  double? netoPagar;
  List<ListaGreso>? listaIngresos;
  List<ListaGreso>? listaEgresos;

  factory RolDePago.fromJson(Map<String, dynamic> json) {
    return RolDePago(
      cabeceraRol: CabeceraRol.fromJson(json['cabeceraRol']),
      observacion: json["observacion"],
      totalIngresos: json["totalIngresos"],
      totalEgresos: json["totalEgresos"],
      netoPagar: json["netoPagar"],
      listaIngresos: List<ListaGreso>.from(
          json["listaIngresos"].map((x) => ListaGreso.fromJson(x))),
      listaEgresos: List<ListaGreso>.from(
          json["listaEgresos"].map((x) => ListaGreso.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "cabeceraRol": cabeceraRol!.toJson(),
        "observacion": observacion,
        "totalIngresos": totalIngresos,
        "totalEgresos": totalEgresos,
        "netoPagar": netoPagar,
        "listaIngresos":
            List<dynamic>.from(listaIngresos!.map((x) => x.toJson())),
        "listaEgresos":
            List<dynamic>.from(listaEgresos!.map((x) => x.toJson())),
      };
}

class CabeceraRol {
  CabeceraRol({
    this.nombres,
    this.apellidos,
    this.division,
    this.empresa,
    this.sucursal,
    this.tipoNomina,
    this.proceso,
    this.periodo,
    this.area,
    this.centroCosto,
    this.subCentroCosto,
    this.cargo,
    this.sueldo,
    this.tipoPago,
  });

  String? nombres;
  String? apellidos;
  String? division;
  String? empresa;
  String? sucursal;
  String? tipoNomina;
  String? proceso;
  String? periodo;
  String? area;
  String? centroCosto;
  String? subCentroCosto;
  String? cargo;
  double? sueldo;
  String? tipoPago;

  factory CabeceraRol.fromJson(Map<String, dynamic> json) {
    return CabeceraRol(
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        division: json["division"],
        empresa: json["empresa"],
        sucursal: json["sucursal"],
        tipoNomina: json["tipoNomina"],
        proceso: json["proceso"],
        periodo: json["periodo"],
        area: json["area"],
        centroCosto: json["centroCosto"],
        subCentroCosto: json["subCentroCosto"],
        cargo: json["cargo"],
        sueldo: json["sueldo"],
        tipoPago: json["tipoPago"]);
  }

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidos": apellidos,
        "division": division,
        "empresa": empresa,
        "sucursal": sucursal,
        "tipoNomina": tipoNomina,
        "proceso": proceso,
        "periodo": periodo,
        "area": area,
        "centroCosto": centroCosto,
        "subCentroCosto": subCentroCosto,
        "cargo": cargo,
        "sueldo": sueldo,
        "tipoPago": tipoPago,
      };
}

class ListaGreso {
  ListaGreso({
    this.descripcion,
    this.cantidad,
    this.valor,
    this.tipoRubro,
  });

  String? descripcion;
  double? cantidad;
  double? valor;
  String? tipoRubro;

  factory ListaGreso.fromJson(Map<String, dynamic> json) => ListaGreso(
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        valor: json["valor"],
        tipoRubro: json["tipoRubro"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "cantidad": cantidad,
        "valor": valor,
        "tipoRubro": tipoRubro,
      };
}