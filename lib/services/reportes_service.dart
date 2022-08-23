import 'dart:convert';

import 'package:enroll_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportesService extends ChangeNotifier {

  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  ProspectoTypeResponse? ObjTipoRsp;

  String TipoIdent = '';
  String NumIdent = '';
  String PassWord = '';
  ClientTypeResponse? ObjRspInicioSesion;
  UsuarioTypeResponse? ObjRspUsuarioDatos;
  UsuarioType? ObjRspUsuario;
  RolDePago? rolDePago;

  bool isLoading = false;
  bool get IsLoading => isLoading;
  set IsLoading (bool value){
    isLoading = value;
    notifyListeners();
  }

  autenticacion(String VarNumIdVal, String Password) async {
    //http://200.110.64.17:5206/api/v1/LdapUser/AuthenticateLdapUser

    print('Cedula para eldarp: $VarNumIdVal');
    print('Clave para eldarp: $Password');
    final response = await http.post(
        Uri.parse('http://200.110.64.17:5206/api/v1/LdapUser/AuthenticateLdapUser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>
          {
            "identificacion": VarNumIdVal,//ObjLlenoProsp.identificacion,
            "password": Password
          }
        ),
      );

      var reponse_rs = response.body;
      print('Respuesta body_dy $reponse_rs');
      final ClienteRsp = ClientTypeResponse.fromJson(response.body);//aquí va a variar el objeto de respuesta cuando se cree el token por el api
      ProspectoType? ObjRsp;
      print('Respuesta inicio sesión ${ClienteRsp.succeeded}');
      ObjRspInicioSesion = ClienteRsp;
      await datosEmpleado(VarNumIdVal);
      notifyListeners();
      
  }


  
  datosEmpleado(String NumIdent) async {
    //http://200.110.64.17:5206/api/v1/LdapUser/AuthenticateLdapUser
    

    final _baseURL = 'http://200.110.64.17:5204/api/v1/Empleados/$NumIdent';

    final _Response = await http.get(Uri.parse(_baseURL));

    if(_Response.statusCode != 200) return null;

    var reponse_rs = _Response.body;
    print('Usuario Response body $reponse_rs');
    final ObjResp = UsuarioTypeResponse.fromJson(_Response.body);// ProspectoTypeResponse.fromJson(_Response.body);
    ObjRspUsuarioDatos = ObjResp;
    ObjRspUsuario = ObjResp.data;
    print('Datos llenos 1: ${ObjRspUsuario!.codigoEmpleado.toString()}');
   
    //notifyListeners();
  }
    

 getProspecto(String TipoIdent,String NumIdent) async {

    final _baseURL = 'http://200.110.64.17:5204/api/v1/Prospectos/$TipoIdent/$NumIdent';

    final _Response = await http.get(Uri.parse(_baseURL));
    if(_Response.statusCode != 200) return null;
    //var reponse_rs = response.statusCode;

    var reponse_rs = _Response.body;
    print('Respuesta bodyyyy $reponse_rs');
    final ProspRsp = ProspectoTypeResponse.fromJson(_Response.body);
    ProspectoType? ObjRsp;
    print('Respuesta $ProspRsp');
    this.ObjTipoRsp = ProspRsp;
    //ProspRsp.statusCode == '001' OR ProspRsp.statusCode == '002'// SI NO EXISTE USUARIO
    notifyListeners();
  }


  getRolPago(String NumIdent, String Periodo) async {
    var rolDePago2 = RolDePago();

    final _baseURL = 'http://200.110.64.17:5204/api/v1/Reportes/GetRolPago/$NumIdent/$Periodo';

    final _Response = await http.get(Uri.parse(_baseURL));


    RolDePagosResponse json = RolDePagosResponse.fromJson(_Response.body);
    rolDePago2.cabeceraRol = json.data?.cabeceraRol;
    rolDePago2.netoPagar = json.data?.netoPagar;
    rolDePago2.totalIngresos = json.data?.totalIngresos;
    rolDePago2.totalEgresos = json.data?.totalEgresos;
    rolDePago2.observacion = json.data?.observacion;
    rolDePago2.listaEgresos = json.data?.listaEgresos;
    rolDePago2.listaIngresos = json.data?.listaIngresos;
    rolDePago = rolDePago2;
    return rolDePago2;
    //notifyListeners();
  }


}
