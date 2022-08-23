import 'dart:convert';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/Finanzas/Reportes/aviso_entrada_screen.dart';
import 'package:enroll_app/screens/Finanzas/Reportes/certificado_trabajo_rpt_screen.dart';
import 'package:enroll_app/screens/Finanzas/Reportes/rol_pagos_rpt_screen.dart';
import 'package:enroll_app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PdfScreenPage extends StatelessWidget {
  ClienteType? invoice;
  String? tipoCertificado;
  String? periodo;
  String? periodoDesc;
  String? correoEnvio;
  bool? mostrarSueldo;

  PdfScreenPage (ClienteType Invoice, String Tipo_Certificado, String? Periodo, String? DescPeriodo, String? envioCorreo, bool MostrarSueldo) {
    invoice = Invoice;
    tipoCertificado = Tipo_Certificado;
    periodo = Periodo;
    periodoDesc = DescPeriodo;
    correoEnvio = envioCorreo;
    mostrarSueldo = MostrarSueldo;
  }

  RolDePago rolDePago = RolDePago();

  //method to make http request
  void certificadoLB() async {
    var url = Uri.parse(
        "http://200.110.64.17:5204/api/v1/Reportes/GetCertifLaboralByIdentificacion/${invoice?.identificacion}");
    var response = await http.get(url);
    final json = UsuarioTypeResponseRpt.fromJson(response.body);
    if(json != null) {
      invoice?.apellidos = json.data?.apellidos;
    invoice?.nombres = json.data?.nombres;
    invoice?.empresa = json.data?.empresa;
    invoice?.rucEmpresa = json.data?.rucEmpresa;
    invoice?.cargo = json.data?.cargo;
    invoice?.fechaIngreso = json.data?.fechaIngreso;
    invoice?.sueldo = json.data?.sueldo;
    invoice?.encargadoCorporativoRrhh =
        json.data?.encargadoCorporativoRrhh; //print(json);
    invoice?.cargoCorporativoRrhh = json.data?.cargoCorporativoRrhh;
    invoice?.grupoCorporativoRrhh = json.data?.grupoCorporativoRrhh;
    invoice?.tipoContrato = json.data?.tipoContrato;
    }
    
  }

  void certificadoRP() async {
    var rolDePago2 = RolDePago();
    var url = Uri.parse("http://200.110.64.17:5204/api/v1/Reportes/GetRolPago/${invoice?.identificacion}/${periodo}");
    var response = await http.get(url);
    RolDePagosResponse json = RolDePagosResponse.fromJson(response.body);
    print('Resp rol de pagos: ${json.data}');
    if(json != null) {
      rolDePago2.cabeceraRol = json.data!.cabeceraRol;
      rolDePago2.netoPagar = json.data!.netoPagar;
      rolDePago2.totalIngresos = json.data!.totalIngresos;
      rolDePago2.totalEgresos = json.data!.totalEgresos;
      rolDePago2.observacion = json.data!.observacion;
      rolDePago2.listaEgresos = json.data!.listaEgresos;
      rolDePago2.listaIngresos = json.data!.listaIngresos;
      rolDePago = rolDePago2;
    }
    
    print(rolDePago.listaIngresos?.length);
  }

  void certificadoAE() async {
    var url = Uri.parse(
        "http://200.110.64.17:5204/api/v1/Reportes/GetAvisoEntradaByIdentificacion/${invoice?.identificacion}");
    var response = await http.get(url);
    final json = UsuarioTypeResponseRpt.fromJson(response.body);
    if(json != null) {
      invoice?.apellidos = json.data?.apellidos;
    invoice?.nombres = json.data?.nombres;
    invoice?.empresa = json.data?.empresa;
    invoice?.rucEmpresa = json.data?.rucEmpresa;
    invoice?.cargo = json.data?.cargo;
    invoice?.fechaIngreso = json.data?.fechaIngreso;
    invoice?.tipoNovedad = json.data?.tipoNovedad;
    invoice?.direccionEmpleado = json.data?.direccionEmpleado;
    invoice?.tipoContrato = json.data?.tipoContrato;
    invoice?.actividadSectorial = json.data?.actividadSectorial;
    invoice?.aportacionNominal = json.data?.aportacionNominal;
    invoice?.representanteLegal = json.data?.representanteLegal;
    invoice?.sucursal = json.data?.sucursal;
    invoice?.sueldo = json.data?.sueldo;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    //final clienteService = Provider.of<certificadoLaboralService>(context);
    //print(clienteService);
    print('Tipo de cert: $tipoCertificado');
    if (tipoCertificado!.toLowerCase() == 'tu aviso de entrada') {
      certificadoAE();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(tipoCertificado ?? ''),
        ),
        body: PdfPreview(
          pdfFileName: "AvisoEntrada.pdf",
          canChangePageFormat: false,
          canDebug: false,
          canChangeOrientation: false,
          build: (context) => avisoEntradaPdf(invoice,correoEnvio!),
        ),
      );
    } else if (tipoCertificado!.toLowerCase() == 'tu certificado laboral') {
      certificadoLB();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(tipoCertificado ?? ''),
        ),
        body: PdfPreview(
          pdfFileName: "CertificadoLaboral.pdf",
          canChangePageFormat: false,
          canDebug: false,
          canChangeOrientation: false,
          build: (context) => certLabPdf(invoice,correoEnvio!,mostrarSueldo!),
        ),
      );
    } else {
      certificadoRP();
      print(rolDePago.cabeceraRol?.apellidos);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(tipoCertificado ?? ''),
        ),
        body: PdfPreview(
          pdfFileName: "RolDePago.pdf",
          canChangePageFormat: false,
          canDebug: false,
          canChangeOrientation: false,
          build: (context) => rolPdf(rolDePago,correoEnvio!,periodoDesc!),
        ),
      );
    }
  }
}