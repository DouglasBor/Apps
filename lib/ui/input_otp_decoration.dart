import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputDecorationsOtp{
  static InputDecoration authInputDecoration() {
    return const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),

                focusedBorder: UnderlineInputBorder(//UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                   )
                  ),

                /*
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(//UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                   )
                  ),
              */
              );
  }
}
