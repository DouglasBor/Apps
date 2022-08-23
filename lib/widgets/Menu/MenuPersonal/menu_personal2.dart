import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPersonal2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [         
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (_, int index) => _MenuPersonalOptions2(index),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuPersonalOptions2 extends StatelessWidget {

  int _Index = 0;
  _MenuPersonalOptions2 (int index){
    _Index = index;
  }

  @override
  Widget build(BuildContext context) {
    List<MenuList> LstMenu = [
      MenuList(IdMenu: 0, NombreMenu: 'Cerrar Sesión', ImagenMenu: 'assets/IcDatosPersonales.png'),
      //MenuList(Index: 1, RutaMemoria: 'assets/IcCertificadoLaboral.png')
    ];
  
    final ListaCalendario = LstMenu[_Index];
    
    return Container(
      color: Colors.transparent,
      width: 133,
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: 110,
            height: 105,
            child: GestureDetector(
                  onTap: () {
                    String IdMenu = ListaCalendario.IdMenu.toString();
                    print('Id Menu: $IdMenu');   
                    if(ListaCalendario.IdMenu == 0) {

                                      Future.microtask(() => 
                                        Navigator.of(context, rootNavigator: true).pushReplacementNamed(SplashScreen.routerName)
                                      );
                    }
                  },
                  child: Container(
                    child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                        Icon(Icons.logout,size: 48,),
                                        Container(width: 52, child: Text(ListaCalendario.NombreMenu, style: TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center))
                                      ],
                                    ),
                                  ],
                    ),
                    width: double.infinity,
                    height: 58,
                   
                    decoration: 
                      /*
                      BoxDecoration(
                        
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        shape: BoxShape.rectangle,
                        color: Color(0xFFF4F4F4),
                      //color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4,-4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(4,4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                        ],
                      ),
                     */
                    BoxDecoration(
                        gradient: const LinearGradient(
                        transform: GradientRotation(-360),
                        colors: <Color>[
                                    /*
                                    Color(0xff6989F5),
                                    Color(0xff906EF5),
                                    */
                                    
                                    
                                    Color.fromRGBO(236, 233, 230, 0.1),
                                    Color.fromRGBO(255, 255, 255, 1),
                                    
                                    
                                  ]
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        shape: BoxShape.rectangle,
                      //color: Color(0xFFF4F4F4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4,-4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(4,4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                        ],
                      )
                      

              ),
            ),
          ),
          
        ]),
      );

  }
}