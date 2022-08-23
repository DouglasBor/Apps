import 'package:flutter/material.dart';

class InputDecorations{
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required bool EsContrasenia,
    required double TamanioIcono,
    IconData? prefxIcon,
    IconData? sufixIcon,
    Color? colorTexto,
    Color? colorBordes,
    Color? colorPrefixIcon,
    required VoidCallback OnPress,
  }) {
    return InputDecoration(
     // border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(1.0))),
                enabledBorder: OutlineInputBorder(//UnderlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: colorBordes != null ? colorBordes :Colors.deepOrange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(//UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorBordes != null ? colorBordes :Colors.deepOrange,
                    width: 2
                   )
                  ),
                hintText: hintText,//'avaldiviezo@riasem.com.ec',
                hintStyle: TextStyle(color: colorTexto),
                errorStyle: TextStyle(color: colorTexto),
                counterStyle: TextStyle(color: colorTexto),
                errorBorder: const UnderlineInputBorder(//UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelText: labelText,//'Correo electrónico',
                labelStyle: TextStyle(color: colorTexto),//TextStyle(color: Colors.white),
                fillColor: colorTexto,//Colors.white,
                
                prefixIcon: prefxIcon != null ? Icon(prefxIcon, color: EsContrasenia ? Colors.white : colorPrefixIcon,) : null, 
                suffixIcon: IconButton(icon: sufixIcon != null ? Icon(sufixIcon, color: Colors.white, size: TamanioIcono,) : Icon(null), onPressed: OnPress,),
                
    );
  }
}
