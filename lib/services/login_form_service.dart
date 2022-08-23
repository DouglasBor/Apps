import 'package:flutter/material.dart';

class LoginFormService extends ChangeNotifier{

  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();

  String PassWord = '';
  String PassWordConfirm = '';

  bool isLoading = false;
  bool get IsLoading => isLoading;
  set IsLoading (bool value){
    isLoading = value;
    notifyListeners();
  }

  bool isOscured = true;
  bool get IsOscured => isOscured;
  set IsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }

  bool isOscuredConfirm = true;
  bool get IsOscuredConfirm => isOscuredConfirm;
  set IsOscuredConfirm (bool value){
    isOscuredConfirm = value;
    notifyListeners();
  }

  bool isValidForm(){
    if(this.PassWord != this.PassWordConfirm){
      return false;
    }
    return FormKey.currentState?.validate() ?? false;
  }

  

  bool Login(String User, String PassWord){
    bool PermiteIngreso = true;

    if(User != 'avaldiviezo@riasem.com.ec' && PassWord != '1234'){
      PermiteIngreso = false;
    }

    return PermiteIngreso;
  }

}