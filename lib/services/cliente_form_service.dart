import 'package:flutter/material.dart';

class ClienteFormService extends ChangeNotifier{

  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();

  String FechaNacimiento = '';
  String Genero = '';
  String Direccion = '';
  String Correo = '';
  String UbicacionLat = '';
  String UbicacionLong = '';

  bool isLoading = false;
  bool get IsLoading => isLoading;
  set IsLoading (bool value){
    isLoading = value;
    notifyListeners();
  }

  bool tieneUbicacion = false;
  bool get TieneUbicacion => tieneUbicacion;
  set TieneUbicacion(bool value){
    tieneUbicacion = value;
    notifyListeners();
  }

  bool isValidForm(){
    var FrmVal = FormKey.currentState?.validate();
    var OBJ = FormKey.currentState;
    print('Formulario valido AV---? $FrmVal');
    return FormKey.currentState?.validate() ?? false;
  }

  bool ValidaFormulario(String FecNac, String Gen, String Dir, String CorreoVar){
    bool PermiteIngreso = true;
    print('Fecha Nacimiento: $FecNac; Género: $Gen; Dirección: $Dir; COrreo: $CorreoVar');

    var FrmVal = FormKey.currentState?.validate();
    print('Formulario valido? $FrmVal');

    if(FecNac != '' && Gen != '' && Dir != '' && CorreoVar != ''){
      PermiteIngreso = false;
    }

    return PermiteIngreso;
  }

}
