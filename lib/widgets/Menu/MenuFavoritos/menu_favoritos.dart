import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';

class MenuFavoritos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //MenuFavoritosEstatico(),
          Expanded(
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, int index) => _MenuFavoritosOptions(index),
              //itemExtent: 10,
            ),
        
            
          )
        ],
      ),
    );
  }
}

class _MenuFavoritosOptions extends StatelessWidget {
  int _Index = 0;
  _MenuFavoritosOptions (int index){
    _Index = index;
  }
  @override
  Widget build(BuildContext context) {
    List<ImagenesMemoria> LstFavoritos = [
      ImagenesMemoria(Index: 0, RutaMemoria: 'assets/IcMarcacion.png'),
      ImagenesMemoria(Index: 1, RutaMemoria: 'assets/IcSolicitudes.png'),
      //ImagenesMemoria(Index: 1, RutaMemoria: 'assets/payment.jpg'),
      ImagenesMemoria(Index: 2, RutaMemoria: 'assets/IcCatering.png'),
      ImagenesMemoria(Index: 3, RutaMemoria: 'assets/IcCredencial.png')
    ];
    final ListaImagenesMemoria = LstFavoritos[_Index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
                    width: 83,
                    height: 90,
                    //color: Colors.green,
                    //margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if(ListaImagenesMemoria.Index == 0){
                              Navigator.pushNamed(context, MarcacionesScreen.routerName, arguments: 'movie-instance');
                            }
                          },
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'), 
                            image: AssetImage(ListaImagenesMemoria.RutaMemoria!),
                            width: 90,
                            height: 90,
                            ),
                        )
                      ]),
                  ),
    );
  }
}
