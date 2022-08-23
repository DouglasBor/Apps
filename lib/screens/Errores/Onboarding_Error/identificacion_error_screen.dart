import 'dart:io';

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IdentificacionErrorScreen extends StatefulWidget {

  static const String routerName = 'identerror';

  @override
  _IdentificacionErrorScreenState createState() => _IdentificacionErrorScreenState();

}

class _IdentificacionErrorScreenState extends State<IdentificacionErrorScreen>{


  @override
  void initState(){
    Future.delayed(
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
  
/*
  @override
  Widget build(BuildContext context) {
    final SizeScreen = MediaQuery.of(context).size;
    return 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
      
          body: Container(
            color: Colors.black,
            decoration: BoxDecoration(
              image: DecorationImage(
                    image: AssetImage('assets/UpsErrorProspecto.png'),
                    fit: BoxFit.cover
                  ),
                ),
            
            child: Column(
                    
            ), 
          ),
            
      ),
    )
;
   
     
  }
*/
    @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
      body: Center(
              child: Container(    
                
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/UpsErrorProspecto.png'), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),              
              /*
              child: ChangeNotifierProvider(
                  create: (_) => TipoIdentificacionEvent(),
                  child: TipoIdentEvnt(_Controller!),
              ),
              */
              
            ),
          ),
      
      ),
    )
   
     ;
     
  }


}
