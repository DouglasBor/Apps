import 'dart:io';

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtpErrorScreen extends StatefulWidget {

  static const String routerName = 'otperror';

  @override
  _OtpErrorScreenState createState() => _OtpErrorScreenState();

}

class _OtpErrorScreenState extends State<OtpErrorScreen>{


  @override
  void initState(){
    Future.delayed( const
      Duration(milliseconds: 4500), 
      () =>
      /*
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Coordenadas: null,Obj_Prosp: Obj_Prosp)),
      ),*/

      Navigator.pop(context),
    );
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
      
          body: Container(
            //color: Colors.transparent,
            decoration: const BoxDecoration(
              image: DecorationImage(
                    image: AssetImage('assets/UpsErrorOtp.png'),
                    fit: BoxFit.cover
                  ),
                ),
            
          ),
            
      ),
    )
;
   
     
  }
}
