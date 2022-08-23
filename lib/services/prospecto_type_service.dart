
import 'dart:convert';

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProspectoTypeService extends ChangeNotifier{

  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();
  ProspectoType? Obj_Rsp;
  ProspectoTypeResponse? ObjTipoRsp;
  ClientTypeResponse? ObjRspRegistro;
  ProspectoRequest? ObjRegistroProspecto;
  String PassWord = '';
  String PassWordConfirm = '';

  bool isOscuredConfirm = true;
  bool get IsOscuredConfirm => isOscuredConfirm;
  set IsOscuredConfirm (bool value){
    isOscuredConfirm = value;
    notifyListeners();
  }

  bool tieneUbicacion = false;
  bool get TieneUbicacion => tieneUbicacion;
  set TieneUbicacion(bool value){
    tieneUbicacion = value;
    notifyListeners();
  }

//  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();
  String Var_Ruta_Url = 'http://192.168.15.155:5204/api/v1/Prospectos/0920693975';
  String FechaNacimiento = '';
  String Genero = '';
  String Direccion = '';
  String Correo = '';
  String UbicacionLat = '';
  String UbicacionLong = '';


  String cedulaSelect = 'assets/BtnCedula_Gris.png';
  String pasaporteSelect = 'assets/BtnPasaporte_Blanco.png';

  String get CedulaSelect => cedulaSelect;
  set CedulaSelect (String value){
    cedulaSelect = value;
    notifyListeners();
  }

  String get PasaporteSelect => pasaporteSelect;
  set PasaporteSelect (String value){
    pasaporteSelect = value;
    notifyListeners();
  }

  String Cedula = '';
  String Pasaporte = '';

  bool isPasaporte = false;
  bool get IsPasaporte => isPasaporte;
  set IsPasaporte (bool value){
    isPasaporte = value;
    notifyListeners();
  }

  bool isOscured = true;
  bool get IsOscured => isOscured;
  set IsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }

  bool tieneNumero = false;
  bool get TieneNumero => tieneNumero;
  set TieneNumero (bool value){
    tieneNumero = value;
    notifyListeners();
  }

  ProspectoTypeService(String TipoIdent, String NumIdent){
    this.getProspecto(TipoIdent, NumIdent);
  }


  bool isValidFormPasword(){
    print('Clave 1: $PassWord');
    print('Clave 2: $PassWordConfirm');
    if(this.PassWord == null || this.PassWordConfirm == null){
      return false;
    }
    else{
      if(this.PassWord != this.PassWordConfirm){
        return false;
      }
      else {
        return true;
      }
    }
    
    //return FormKey.currentState?.validate() ?? false;
  }

  bool isValidForm(){
    /*
    if(){

    }
    */
    print('Clave 1: $PassWord');
    print('Clave 2: $PassWordConfirm');
    print('Obje lleno: $Obj_Rsp');
    return FormKey.currentState?.validate() ?? false;
  }

  bool Login(String User, String PassWord){
    bool PermiteIngreso = true;

    if(User != 'avaldiviezo@riasem.com.ec' && PassWord != '1234'){
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

  bool isParamsForm(){
    String pattern = r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{10,20}$';
    RegExp regExp  = RegExp(pattern);
    print('Clave 1a: $PassWord');
    print('Clave 2a: $PassWordConfirm');
    return regExp.hasMatch(PassWord) ? true : false;
  }

  String MensajeError(){
    String pattern = r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{10,20}$';
    RegExp regExp  = RegExp(pattern);
    String MensajeValidacion = regExp.hasMatch(PassWord) ? '' : 'Clave no cumple con los parámetros solicitados';
    print('Es caracter especial?? $MensajeValidacion');
    if(this.PassWord != this.PassWordConfirm){
      MensajeValidacion = 'Las contraseñas deben coincidir';
    }
    return MensajeValidacion;
  }


 getProspecto(String TipoIdent,String NumIdent) async {
    

/*
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;
    
    notifyListeners();

    */
     /*
    var url = Uri.http('192.168.15.155:5204','/api/v1/Prospectos', {
      'Cedula':_Cedula
    });

    //var url = Uri.https('jsonplaceholder.typicode.com','/posts/1');
    
    final response = await http.get(url);

    if(response.statusCode != 200) print('Error $response');
    */

    final _baseURL = 'http://200.110.64.17:5204/api/v1/Prospectos/$TipoIdent/$NumIdent';

    final _Response = await http.get(Uri.parse(_baseURL));
    if(_Response.statusCode != 200) return null;
    //var reponse_rs = response.statusCode;

    var reponse_rs = _Response.body;
    print('Respuesta body $reponse_rs');
    final ProspRsp = ProspectoTypeResponse.fromJson(_Response.body);
    ProspectoType? ObjRsp;
    print('Respuesta $ProspRsp');
    this.ObjTipoRsp = ProspRsp;
    if(ProspRsp.statusCode == '000' && ProspRsp.succeeded){
      this.Obj_Rsp = ProspRsp.data;
    }
    //ProspRsp.statusCode == '001' OR ProspRsp.statusCode == '002'// SI NO EXISTE USUARIO
    notifyListeners();
  }

  bool llenaData(ProspectoType ObjPrpTp){
    bool frmValido = true;
    String Fecha = ObjPrpTp.fechaNacimiento;
    print('Obje lleno form: $ObjPrpTp');
    print('Fecha de nacimientoOO: $Fecha');

    print('Validando frm');

    if(ObjPrpTp.fechaNacimiento == null || ObjPrpTp.fechaNacimiento == '' || ObjPrpTp.genero == null || ObjPrpTp.genero == 'S' || ObjPrpTp.direccion == null || ObjPrpTp.email == null || ObjPrpTp.email == '' || ObjPrpTp.longitud == null || ObjPrpTp.longitud == '' || ObjPrpTp.latitud == null || ObjPrpTp.latitud  == '') {
      frmValido = false;
      print('Invalido frm');
    }
    return frmValido;
    //return FormKey.currentState?.validate() ?? false;
  }

  registraProspecto(ProspectoType ObjLlenoProsp) async {
    bool rspValida = true;
    DateTime FecNac = ObjLlenoProsp.FechaNacDate;
    print('Fecha: $FecNac');
    
    if(ObjLlenoProsp != null){
      final response = await http.post(
        Uri.parse('http://200.110.64.17:5204/api/v1/Clientes/CreateCliente'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>
          {
            "tipoidentificacion": ObjLlenoProsp.tipoIdentificacion,
            "identificacion": ObjLlenoProsp.identificacion,
            "genero": ObjLlenoProsp.genero,
            "latitud": ObjLlenoProsp.latitud.toString(),
            "longitud": ObjLlenoProsp.longitud.toString(),
            "direccion": ObjLlenoProsp.direccion,
            "fechaNacimiento": ObjLlenoProsp.FechaNacDate.toString(),
            "correo": ObjLlenoProsp.email,
            "password": PassWord
          }
        ),
      );

      var reponse_rs = response.body;
      print('Respuesta body_dy $reponse_rs');
      final ProspRsp = ClientTypeResponse.fromJson(response.body);//aquí va a variar el objeto de respuesta cuando se cree el token por el api
      ProspectoType? ObjRsp;
      print('Respuesta creación prospecto $ProspRsp');
      ObjRspRegistro = ProspRsp;
/*
      ObjLlenoProsp.password = PassWord;
      AutenticacionService ObjServ = AutenticacionService();
      ObjServ.autenticacion(ObjLlenoProsp);
      */
    }
    else {
      rspValida = false;
    }
    notifyListeners();
  }

}
