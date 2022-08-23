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

  
  ClienteType? invoice;
  String? tipoCertificado;
  String? periodo;
  String? periodoDesc;
  String? correoEnvio;

class PdfPreviewPage extends StatefulWidget {
  
  //PdfPreviewPage({Key? key, required invoice, required tipoCertificado}) : super(key: key);

  PdfPreviewPage(ClienteType Invoice, String Tipo_Certificado, String? Periodo, String? DescPeriodo, String? envioCorreo) {
    invoice = Invoice;
    tipoCertificado = Tipo_Certificado;
    periodo = Periodo;
    periodoDesc = DescPeriodo;
    correoEnvio = envioCorreo;
  }

  @override
  ReportesGeneral createState() => ReportesGeneral();

/*
  RolDePago rolDePago = RolDePago();

  //method to make http request
  void certificadoLB() async {
    var url = Uri.parse(
        "http://200.110.64.17:5204/api/v1/Reportes/GetCertifLaboralByIdentificacion/${invoice?.identificacion}");
    var response = await http.get(url);
    await Future.delayed(const Duration(seconds: 15));
    final json = UsuarioTypeResponseRpt.fromJson(response.body);
    invoice?.apellidos = json.data.apellidos;
    invoice?.nombres = json.data.nombres;
    invoice?.empresa = json.data.empresa;
    invoice?.rucEmpresa = json.data.rucEmpresa;
    invoice?.cargo = json.data.cargo;
    invoice?.fechaIngreso = json.data.fechaIngreso;
    invoice?.sueldo = json.data.sueldo;
    invoice?.encargadoCorporativoRrhh = json.data.encargadoCorporativoRrhh; //print(json);
    invoice?.cargoCorporativoRrhh = json.data.cargoCorporativoRrhh;
    invoice?.grupoCorporativoRrhh = json.data.grupoCorporativoRrhh;
    invoice?.tipoContrato = json.data.tipoContrato;
  }

  void certificadoRP() async {
    var rolDePago2 = RolDePago();
    var url = Uri.parse(
        "http://200.110.64.17:5204/api/v1/Reportes/GetRolPago/${invoice?.identificacion}/${periodo}");
    var response = await http.get(url);
    await Future.delayed(const Duration(seconds: 15));
    RolDePagosResponse json = RolDePagosResponse.fromJson(response.body);
    rolDePago2.cabeceraRol = json.data?.cabeceraRol;
    rolDePago2.netoPagar = json.data?.netoPagar;
    rolDePago2.totalIngresos = json.data?.totalIngresos;
    rolDePago2.totalEgresos = json.data?.totalEgresos;
    rolDePago2.observacion = json.data?.observacion;
    rolDePago2.listaEgresos = json.data?.listaEgresos;
    rolDePago2.listaIngresos = json.data?.listaIngresos;
    rolDePago = rolDePago2;
    print(rolDePago.listaIngresos?.length);
  }

  void certificadoAE() async {
    var url = Uri.parse(
        "http://200.110.64.17:5204/api/v1/Reportes/GetAvisoEntradaByIdentificacion/${invoice?.identificacion}");
    var response = await http.get(url);
    await Future.delayed(const Duration(seconds: 15));
    final json = UsuarioTypeResponseRpt.fromJson(response.body);
    invoice?.apellidos = json.data.apellidos;
    invoice?.nombres = json.data.nombres;
    invoice?.empresa = json.data.empresa;
    invoice?.rucEmpresa = json.data.rucEmpresa;
    invoice?.cargo = json.data.cargo;
    invoice?.fechaIngreso = json.data.fechaIngreso;
    invoice?.tipoNovedad = json.data.tipoNovedad;
    invoice?.direccionEmpleado = json.data.direccionEmpleado;
    invoice?.tipoContrato = json.data.tipoContrato;
    invoice?.actividadSectorial = json.data.actividadSectorial;
    invoice?.aportacionNominal = json.data.aportacionNominal;
    invoice?.representanteLegal = json.data.representanteLegal;
    invoice?.sucursal = json.data.sucursal;
    invoice?.sueldo = json.data.sueldo;
  }
*/
}


class ReportesGeneral extends State<PdfPreviewPage>{

  @override
  Widget build(BuildContext context) {
    /*
    final rptService = Provider.of<ReportesService>(context);
    RolDePago? rol_Pago = rptService.getRolPago(invoice!.identificacion!,periodo!);
    print('Rpt lleno: ${rol_Pago}');
*/
    if (tipoCertificado!.toLowerCase() == 'tu aviso de entrada') {
      //certificadoAE();
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
          build: (context) => avisoEntradaPdf(invoice,''),
        ),
      );
    } else if (tipoCertificado!.toLowerCase() == 'tu certificado laboral') {
      //certificadoLB();
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
          build: (context) => certLabPdf(invoice,'',false),
        ),
      );
    } else {
        return _FrmRolPagosScreen();
      /*
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
          build: (context) => rolPdf(rol_Pago!),
        ),
      );
      */
    
    }    
  
  }
}


class _FrmRolPagosScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
   
    return Scaffold(
      backgroundColor: Colors.black,//Color.fromRGBO(3, 9, 23, 1),
      body: SingleChildScrollView(
        child: Center(
          child: ChangeNotifierProvider(
                  create: (_) => ReportesService(),
                  child: RptRolPagos(),
          ),
        ),
      ),
    );
  
  }
}

class RptRolPagos extends StatelessWidget {
  bool _isObscured = true;
  ProspectoType? ObjetoProspecto;
  @override
  Widget build(BuildContext context) {
    final rptService = Provider.of<ReportesService>(context);
    RolDePago ObjRolPago = rptService.getRolPago(invoice!.identificacion!,periodo!);
    
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
          build: (context) => rolPdf(ObjRolPago,'',''),
        ),
      );
    
    }
  }


