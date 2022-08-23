import 'dart:convert';

import 'package:enroll_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClienteService extends ChangeNotifier{

  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();
  OtpResponse? Obj_Rsp;

  String Campo1 = '';
  String Campo2 = '';
  String Campo3 = '';
  String Campo4 = '';
  String Campo5 = '';
  String Campo6 = '';

  bool isCaducado = false;
  bool get IsCaducado => isCaducado;
  set IsCaducado (bool value){
    isCaducado = value;
    notifyListeners();
  }

  bool isValidForm(){
    print('Valor total $Campo1 $Campo2 $Campo3 $Campo4 $Campo5 $Campo6');
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


 registraCliente(String _Cedula) async {
    String CodigoOtp = Campo1+Campo2+Campo3+Campo4+Campo5+Campo6;
    final response = await http.post(
    Uri.parse('http://200.110.64.17:5204/api/v1/Clientes/CreateCliente'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'identificacion': CodigoOtp,
      'fechaNacimiento': _Cedula,
      'genero': '',
      'direccion': '',
      'latitud': '0',
      'longitud': '',
      'correo': ''
    }),
    );
    var decodedData2 = response.body;
    final ProspRsp = OtpResponse.fromJson(response.body);
    print('Respuesta POST 2 $decodedData2');
    
    this.Obj_Rsp = ProspRsp;
    notifyListeners();

  }

    

}