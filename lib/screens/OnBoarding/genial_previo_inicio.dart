import 'dart:io';

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'dart:async';
import 'dart:io';

import 'package:uni_links/uni_links.dart';

class GenialPrevioInicioScreen extends StatefulWidget {

  static const String routerName = 'geniallast';

  ProspectoType? Obj_Prosp;

  GenialPrevioInicioScreen(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
    var Nombre = Obj_Prosp!.nombres;
    print('Obj Prosp-- $Nombre');
  }

  @override
  _GenialPrevioInicioScreenState createState() => _GenialPrevioInicioScreenState(Obj_Prosp);

}

class _GenialPrevioInicioScreenState extends State<GenialPrevioInicioScreen>{
  ProspectoType? Obj_Prosp;


   StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    _sub = linkStream.listen((String? link) {
      if(link != null){
        print('Escuchando');
        var uri = Uri.parse(link);
        print('Test de parámetros ${uri.queryParameters}');
        
        if(uri.queryParameters['id'] != null){
          Future.delayed(
            Duration(milliseconds: 4500), 
            () =>
            /*Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => PrincipalScreen()),
            ),*/
            Future.microtask(() => 
                                        Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName)
                                      ),
          );

        }
        
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  _GenialPrevioInicioScreenState(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
  }


  @override
  void initState(){
    //Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName);
    /*
    
    */
    super.initState();
    initUniLinks();
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
                    image: AssetImage('assets/GenialActivado.png'),
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
