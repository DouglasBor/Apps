import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';

UsuarioType? Obj_UserGeneralFinanzas;

class MenuFinanzas extends StatelessWidget {


  UsuarioType? ObjUser;
  UsuarioType? Obj_User;

  MenuFinanzas({ObjUser}){
    Obj_User = ObjUser;
    Obj_UserGeneralFinanzas = ObjUser;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [         
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (_, int index) => _MenuTramitesSolicitadosOptions(index),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuTramitesSolicitadosOptions extends StatelessWidget {

  int _Index = 0;
  _MenuTramitesSolicitadosOptions (int index){
    _Index = index;
  }

  @override
  Widget build(BuildContext context) {
    List<ImagenesMemoria> LstFavoritos = [
      ImagenesMemoria(Index: 0, RutaMemoria: 'assets/IcRolPago.png'),
      
      ImagenesMemoria(Index: 1, RutaMemoria: 'assets/BtnPermisos.png'),
     ImagenesMemoria(Index: 2, RutaMemoria: 'assets/BtnPrestamo.png')
    
    ];
    final ListaImagenesMemoria = LstFavoritos[_Index];
    return Container(
            width: 130,
            height: 85,
                  //color: Colors.green,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(

              children: [
                       
                GestureDetector(
                  onTap: () {
                    if(ListaImagenesMemoria.Index! == 0){
                      print('Rol pagos ${Obj_UserGeneralFinanzas!.apellidos}');
                      //Navigator.pushNamed(context, RolPagosScreen.routerName, arguments: 'movie-instance');
                      Future.microtask(() => 
                                        
                                        Navigator.push(
                                          context,
                                          //CupertinoPageRoute(builder: (context) => PrincipalScreen()),
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => RolPagosScreen(ObjUser: Obj_UserGeneralFinanzas),
                            transitionDuration: const Duration(seconds: 0),
                          )
                        )
                      );
                                      
                    }
                    if(ListaImagenesMemoria.Index! == 1){
                      //Navigator.pushNamed(context, RolPagosScreen.routerName, arguments: 'movie-instance');
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