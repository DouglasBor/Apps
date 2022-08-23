import 'dart:io';

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BienvenidoLastScreen extends StatefulWidget {

  static const String routerName = 'bienvenidolast';

  ProspectoType? Obj_Prosp;

  BienvenidoLastScreen(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
    var Nombre = Obj_Prosp!.nombres;
    print('Obj Prosp-- $Nombre');
  }

  @override
  _BienvenidoLastScreenState createState() => _BienvenidoLastScreenState(Obj_Prosp);

}

class _BienvenidoLastScreenState extends State<BienvenidoLastScreen>{
  ProspectoType? Obj_Prosp;

  _BienvenidoLastScreenState(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
  }


  @override
  void initState(){
    Future.delayed(
      Duration(milliseconds: 4500), 
      () =>
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Coordenadas: null,Obj_Prosp: Obj_Prosp)),
      ),
    );
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final SizeScreen = MediaQuery.of(context).size;
    return 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
      
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                    //image: AssetImage('assets/splash3.png'), 
                    image: AssetImage('assets/BnvLast.png'),
                    fit: BoxFit.cover
                  ),
                ),
            
            child: Column(
                    children: <Widget>[
                        Expanded(
                                  child: Center(),
                                ),

                                SizedBox(height: 80),

                       Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text('',style: TextStyle(color: Colors.white, fontSize: 20),),

                                Text(Obj_Prosp!.alias + '!',textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 70)),
                                     
                                Text('',style: TextStyle(color: Colors.white, fontSize: 20),),
                                
                            ],
                        ),
                        Expanded(
                                  child: Center(),
                                ),
                        
                    ]
            ), 
            //child: ContainerGeneral(Var_Cedula),
          ),
            
              /*
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: FloatingActionButton(
                elevation: 1,
                onPressed: () => exit(0), 
                backgroundColor: Colors.white12,
                child: const Icon(Icons.close,size: 40,),
              ),
        */
      ),
    )
;
   
     
  }
}


class ContainerGeneralBnv extends StatelessWidget {

  String Var_Cedula = '';
  String NombreDuenio = '';
  ContainerGeneral(String Cedula){
    Var_Cedula = Cedula;
    if(Var_Cedula == '0922219480'){
      NombreDuenio = 'Ángel';
    }
    if(Var_Cedula == '0951810993'){
      NombreDuenio = 'Jorge';
    }
    if(Var_Cedula == '0924373616'){
      NombreDuenio = 'David';
    }
    if(Var_Cedula == '0920693975'){
      NombreDuenio = 'Carlos';
    }
    if(Var_Cedula == '0909555260'){
      NombreDuenio = 'Milton';
    }
  }

  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {

    return Container(
              child: Column(
                children: <Widget>[
                    SizedBox(height: 20,),
                    Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                MaterialButton(
                                              shape: CircleBorder(),
                                              disabledColor: Colors.white,
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child: Container(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                              onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
                                              //Navigator.of(context).maybePop(),
                                              //Navigator.of(context, rootNavigator: true).pop(context),
                                              //Navigator.pop(context),
                                              /*
                                              {
                                                //Navigator.of(context).pop();
                                                Navigator.pop(context);
                                              },
                                              */
                                          ),

/*
                                  IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    color: Colors.white,
                                    hoverColor: Colors.grey[400],
                                    onPressed: (){
                                      print('atrás');
                                                    Navigator.of(context).pop();
                                                },

                                  ),
                                */

                                //SizedBox(height: 5,),
                                Text('Paso 2 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),

                                /*
                                 IconButton(
                                    icon: Icon(Icons.cancel_outlined),
                                    color: Colors.white,
                                    hoverColor: Colors.grey[400],
                                    onPressed: (){
                                      print('salir');
                                                    exit(0);
                                                },

                                  ),
                                  */


                                MaterialButton(
                                        shape: CircleBorder(),
                                        disabledColor: Colors.white,
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Container(child: Icon(Icons.close,color: Colors.white,size: 35,),),
                                        onPressed: () => //print('salir')//
                                          exit(0), 
                                      ),
                                      
                            ],),
                      
                    Container(
                        //height: 90,
                      height: 110,
                      child: Expanded(
                        child: Container(
                          
                            //color: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text("",
                                      style: TextStyle(
                                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                                ]))),
                      
                    ), // Text Top

                    Expanded(
                        child: 
                            Row(children: [
        
                              SizedBox(height: 10, width: 40,),
                              Container(width: 83, child: Expanded(child: Row(),)),
                              Column(
                                children: [
                                  Align(
                                        child: Container(
                                                  //height: 100,
                                                  //width: 330,
                                                  child: Text(NombreDuenio,textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 60)),
                                        ),
                                      )
                              ],)
                            ],),
                        
                      ),
        
                    Expanded(
                        child: Container(
                          
                            //color: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text("",
                                      style: TextStyle(
                                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                                ]))),
                      
                    Expanded(
                        child: Container(
                          
                            //color: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text("",
                                      style: TextStyle(
                                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                                ]
                              )
                            )
                          ),
                      
        ],
      ),
    );
  }
}