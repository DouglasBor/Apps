import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';



class BuscaCorreoScreen extends StatefulWidget {

  static const String routerName = 'buscacorreoscreen';

  ProspectoType? Obj_Prosp;

  BuscaCorreoScreen(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
    var Nombre = Obj_Prosp!.nombres;
    print('Obj Prosp-- $Nombre');
  }

  @override
  _BuscaCorreoScreenState createState() => _BuscaCorreoScreenState(Obj_Prosp);

}

class _BuscaCorreoScreenState extends State<BuscaCorreoScreen>{
  ProspectoType? Obj_Prosp;



  _BuscaCorreoScreenState(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
  }

  @override
  void initState() {
    
    Future.delayed(
      const Duration(milliseconds: 8000), 
      () =>
      Navigator.push(
        context,
        //CupertinoPageRoute(builder: (context) => GenialPrevioInicioScreen(Obj_Prosp)),
        CupertinoPageRoute(builder: (context) => AuthenticationScreen()),
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/VeBuscaCorreo.png'),
                fit: BoxFit.cover
              ),
            ),
            
            child: Center(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
          
                              
                                const SizedBox(height: 100,),

/*
                                const Expanded(
                                  child: Center(),
                                ),
                                */
                         
                                Center(
                                  child: Text(Obj_Prosp!.alias,style: TextStyle(color: Colors.orange[700], fontSize: 32),),
                                ),
          

                                const SizedBox(height: 10,),
          
                                const Center(
                                  child: Text('te hemos enviado',style: TextStyle(color: Colors.white, fontSize: 28),),                              
                                ),

                               const Center(
                                child: Text('un correo electrónico',style: TextStyle(color: Colors.white, fontSize: 28),),                              
                               ),

                               const Center(
                                child: Text('a la dirección',style: TextStyle(color: Colors.white, fontSize: 28),),                              
                               ),

                                const SizedBox(height: 5,),
                                /*
                                Center(
                                    child: Text(Obj_Prosp!.email,style: TextStyle(color: Colors.orange[700], fontSize: 24),),
                                          
                                ),
                                */

                                AutoSizeText(
                                  '${Obj_Prosp!.email} ',
                                  style: TextStyle(fontSize: 20, color: Colors.orange[700],fontWeight: FontWeight.bold,),
                                  maxLines: 2,
                                ),

                                const Center(
                                child: Text('con las instrucciones',style: TextStyle(color: Colors.white, fontSize: 28),),                              
                               ),

                               const Center(
                                child: Text('de activación del servicio',style: TextStyle(color: Colors.white, fontSize: 28),),                              
                               ),
                                    
                      const SizedBox(height: 70,),
          

                      Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('',style: TextStyle(color: Colors.white, fontSize: 1),),
      
                                    Text('Anda y búscalo...',style: TextStyle(color: Colors.white, fontSize: 28),),
      
                                    //Text('',style: TextStyle(color: Colors.white, fontSize: 40),),
                                            
                                  ],
                                ),

          
                              ],
                            ),
                          ),
                        
                        ),
                      )
                    ],
                  ),
                ),
            
            /*
            Column(
                    children: <Widget>[
                      //const Expanded( child: Center(),),

                      const SizedBox(height: 100),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),

                            Text(Obj_Prosp!.alias,textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 70)),
                                       
                            const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 100),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),

                            Text(Obj_Prosp!.email,textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 20)),
                                       
                            const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),
                          ],
                        ),
                      ),
                      

                      const Expanded( child: Center(), ),
              ],
            ), 
            

            */
          ),
            
      ),
    );
   
     
  }
}
