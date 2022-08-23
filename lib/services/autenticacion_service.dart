import 'dart:convert';

import 'package:enroll_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutenticacionService extends ChangeNotifier{

  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  ProspectoTypeResponse? ObjTipoRsp;

  String TipoIdent = '';
  String NumIdent = '';
  String PassWord = '';
  ClientTypeResponse? ObjRspInicioSesion;
  UsuarioTypeResponse? ObjRspUsuarioDatos;
  UsuarioType? ObjRspUsuario;

  bool isLoading = false;
  bool get IsLoading => isLoading;
  set IsLoading (bool value){
    isLoading = value;
    notifyListeners();
  }

  String cedulaSelect = 'assets/BtnCedula_Gris.png';
  String pasaporteSelect = 'assets/BtnPasaporte_Blanco.png';

  String get CedulaSelect => cedulaSelect;
  set CedulaSelect (String value){
    cedulaSelect = value;
    notifyListeners();
  }

  String Cedula = '';
  String Pasaporte = '';


  bool isOscured = true;
  bool get IsOscured => isOscured;
  set IsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }


  String get PasaporteSelect => pasaporteSelect;
  set PasaporteSelect (String value){
    pasaporteSelect = value;
    notifyListeners();
  }


  bool isPasaporte = false;
  bool get IsPasaporte => isPasaporte;
  set IsPasaporte (bool value){
    isPasaporte = value;
    notifyListeners();
  }

  bool isValidForm(){
    var valvar = FormKey.currentState?.validate();
    print('Es valido? $valvar');
    return FormKey.currentState?.validate() ?? false;
  }

  bool ValidaFormulario(String FecNac, String Gen, String Dir, String CorreoVar){
    bool PermiteIngreso = true;
    print('Fecha Nacimiento: $FecNac; Género: $Gen; Dirección: $Dir; COrreo: $CorreoVar');

    if(FecNac != '' && Gen != '' && Dir != '' && CorreoVar != ''){
      PermiteIngreso = false;
    }

    return PermiteIngreso;
  }

  String ValidaCedula(String VarCedula){
    
    String MensajeCedulaValida = '';

    if(VarCedula.length == 10){
      int Digito_Region = int.parse(VarCedula.substring(0,2));

      if(Digito_Region >= 1 && Digito_Region <= 24){

        int UltimoDigito = int.parse(VarCedula.substring(9,10));
        int Pares = int.parse(VarCedula.substring(1,2)) + int.parse(VarCedula.substring(3,4)) + int.parse(VarCedula.substring(5,6)) + int.parse(VarCedula.substring(7,8));
        
        int Num1 = int.parse(VarCedula.substring(0,1));
        int N1 = Num1 * 2;

        if(N1 > 9){
          N1 = N1 - 9;
        }

        int Num3 = int.parse(VarCedula.substring(2,3));
        int N3 = Num3 * 2;
        if(N3 > 9){
          N3 = N3 - 9;
        }

        int Num5 = int.parse(VarCedula.substring(4,5));
        int N5 = Num5 * 2;
        if(N5 > 9){
          N5 = N5 - 9;
        }

        int Num7 = int.parse(VarCedula.substring(6,7));
        int N7 = Num7 * 2;
        if(N7 > 9){
          N7 = N7 - 9;
        }

        int Num9 = int.parse(VarCedula.substring(8,9));
        int N9 = Num9 * 2;
        if(N9 > 9){
          N9 = N9 - 9;
        }

        int Impares = N1 + N3 + N5 + N7 + N9;
        int Suma_Total = Pares + Impares;
        String PrimerDigitoSuma = Suma_Total.toString().substring(0,1);
        int Decena = (int.parse(PrimerDigitoSuma) + 1) * 10;
        int Digito_Validador = Decena - Suma_Total;

        if(Digito_Validador == 10){
          Digito_Validador = 0;
        }

        if(Digito_Validador == UltimoDigito){
          MensajeCedulaValida = 'Ok';//'La cédula: ' + VarCedula + ' es correcta';
        }
        else{
          MensajeCedulaValida = 'La cédula: ' + VarCedula + ' es incorrecta';
        }

      }
      else{
        MensajeCedulaValida = 'Esta cédula no pertenece a ninguna región';
      }
    }
    else{
      MensajeCedulaValida = 'Esta cédula tiene menos de 10 digitos';
    }
    print(MensajeCedulaValida);
    return MensajeCedulaValida;
  }

  bool isValidFormAutenticacion(){
print('Cedula ingresadaaa: $Cedula');
    var ValCed = ValidaCedula(Cedula);
    if(ValCed == 'Ok'){
      return true;
    }
    else{
      return false;
    }
    //return FormKey.currentState?.validate() ?? false;
  }

  bool Login(String User, String PassWord){
    bool PermiteIngreso = true;

    if(User != 'avaldiviezo@riasem.com.ec' && PassWord != '1234'){
      PermiteIngreso = false;
    }

    return PermiteIngreso;
  }

  consultaCedula() {

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


}
