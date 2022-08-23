import 'dart:io';

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

 String MsmError1 = '';
 String MsmError2 = '';

class AutenticacionErrorScreen extends StatefulWidget {

  static const String routerName = 'autenticacionerror';
 

  AutenticacionErrorScreen(String Msm_Error1, String Msm_Error2){
    MsmError1 = Msm_Error1;
    MsmError2 = Msm_Error2;
  }

  @override
  _AutenticacionErrorScreenState createState() => _AutenticacionErrorScreenState();

}

class _AutenticacionErrorScreenState extends State<AutenticacionErrorScreen>{


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
    final SizeScreen = MediaQuery.of(context).size;
    return 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      //color: Colors.black,
      //darkTheme: ThemeData.dark(),
      home: Scaffold(
      //backgroundColor: Colors.white54,
          body: Container(
           /* width: SizeScreen.width,
            height: SizeScreen.height,*/
            //color: Colors.transparent,
            width: double.infinity,
            decoration: const BoxDecoration(
              
              image: DecorationImage(
                
                    image: AssetImage('assets/UpsErrorAppHombre.png'),
                    fit: BoxFit.cover
                  ),
                ),
            child: Container(
              child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
          
                                const SizedBox(height: 50,),
          
                                
                                Expanded(
                                              child: 
                                                Row(
                                              
                                              ),
                                            ),
                                Expanded(
                                              child: 
                                                Row(
                                              
                                              ),
                                            ),
                                Expanded(
                                              child: 
                                                Row(
                                              
                                              ),
                                            ),
                                
                                Expanded(
                                              child: 
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: 
                                                  [
                                                    const Text('',style: TextStyle(color: Colors.red, fontSize: 20),),
                                                    Column(
                                                      children: [
                                                          Text(MsmError1!,style: TextStyle(color: Colors.black54, fontSize: 25, decorationStyle: TextDecorationStyle.solid),),
                                                    Text(MsmError2!,style: TextStyle(color: Colors.black54, fontSize: 25, decorationStyle: TextDecorationStyle.solid),),
                                                      ],
                                                    ),
                                                    
                                                    const Text('',style: TextStyle(color: Colors.red, fontSize: 20),),
                                                  ],
                                              
                                              ),
                                            ),




                              ]
                            )
              )


////

            ),
          ),
            
      ),
    )
;
   
     
  }
}