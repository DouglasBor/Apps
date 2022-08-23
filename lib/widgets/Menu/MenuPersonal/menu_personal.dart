import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

UsuarioType? Obj_UserGeneral;

class MenuPersonal extends StatelessWidget {


  UsuarioType? ObjUser;
  UsuarioType? Obj_User;

  MenuPersonal({ObjUser}){
    Obj_User = ObjUser;
    Obj_UserGeneral = ObjUser;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [         
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (_, int index) => _MenuPersonalOptions(index),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuPersonalOptions extends StatelessWidget {

  int _Index = 0;
  _MenuPersonalOptions (int index){
    _Index = index;
  }

  @override
  Widget build(BuildContext context) {
    List<ImagenesMemoria> LstFavoritos = [
      //ImagenesMemoria(Index: 0, RutaMemoria: 'assets/IcDatosPersonales.png'),
      ImagenesMemoria(Index: 0, RutaMemoria: 'assets/IcCertificadoLaboral.png'),
      
      
     ImagenesMemoria(Index: 1, RutaMemoria: 'assets/IcAvisoEntrada.png')
    
    ];
    final ListaImagenesMemoria = LstFavoritos[_Index];
    return Container(
            width: 120,
            height: 62,
                  //color: Colors.green,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(

              children: [
                       
                GestureDetector(
                  onTap: () {
                    if(ListaImagenesMemoria.Index! == 0){
                      //Navigator.pushNamed(context, RolPagosScreen.routerName, arguments: 'movie-instance'); 
                    }
                    if(ListaImagenesMemoria.Index! == 0){
                      //Navigator.pushNamed(context, CertificadoLaboralScreen.routerName, arguments: 'movie-instance');
                      Future.microtask(() => 
                        Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => CertificadoLaboralScreen(ObjUser: Obj_UserGeneral!,),
                          ),
                        )
                      );
                    }
                    if(ListaImagenesMemoria.Index! == 1){
                      //Navigator.pushNamed(context, AvisoEntradaScreen.routerName, arguments: 'movie-instance');
                      //AvisoEntradaScreen
                      Future.microtask(() => 
                        Navigator.of(context, rootNavigator: true).push(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => AvisoEntradaScreen(ObjUser: Obj_UserGeneral!,),
                          ),
                        )
                      );
                    }
                  },
                  child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'), 
                      image: AssetImage(ListaImagenesMemoria.RutaMemoria!),
                      ),
                    )
                  ]),
                );
  }
}