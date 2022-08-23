import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/Menu/Menu_Circular/circular_button.dart';
import 'package:enroll_app/widgets/Menu/TabBar/tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


import 'dart:async';
import 'dart:io';

import 'package:uni_links/uni_links.dart';

UsuarioType? Obj_Usuario;

class PrincipalScreen extends StatefulWidget{
 static const String routerName = 'principal';
 UsuarioType? ObjUser;
 UsuarioType? Obj_User;

 PrincipalScreen({ObjUser}){
  Obj_User = ObjUser;
  Obj_Usuario = ObjUser;
 }

  @override
  _PrincipalScreen createState() => _PrincipalScreen(Obj_User!);
 
}

class _PrincipalScreen extends State<PrincipalScreen>{
 
  UsuarioType? Obj_User;
  
 _PrincipalScreen(UsuarioType ObjUser){
  Obj_User = ObjUser;
 }
  
  StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    // ... check initialLink

    // Attach a listener to the stream
    _sub = linkStream.listen((String? link) {
      if(link != null){
        print('Escuchando');
        var uri = Uri.parse(link);
        print('Test ${uri.queryParameters}');
        if(uri.queryParameters['id'] != null){
          print('');
        }
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  int VarIndex = 0;
  //final placeholder = Opacity(opacity: 20, child:IconButton(onPressed: null, icon: Icon(Icons.no_cell)));
  final Pages = <Widget>[
    //PersonalScreen(),
    HomeScreen(),
    FinanzasScreen(ObjUser: Obj_Usuario),
    HomeScreen(),
    FinanzasScreen(),
  ];

  late PageController pageController;
  @override
  void initState() {
    super.initState();
    initUniLinks();
    pageController = PageController(initialPage: VarIndex);
  }

  @override
  Widget build(BuildContext context) => 
  SafeArea(
    child: Scaffold(
      extendBody: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.orange[700],
          title: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              setState(() {
                VarIndex = -1;
              });
            }, 
          ),
          elevation: 0,
          actions: [
            const Positioned(child: Image(image: AssetImage('assets/LogoBlanco.png'), alignment: Alignment.centerRight, width: 150, )),
            const SizedBox(width: 50),
            IconButton(
              icon: const Icon(Icons.campaign_outlined),
              color: Colors.white,
              tooltip: 'Anuncios',
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              color: Colors.white,
              tooltip: 'Notificaciones',
              onPressed: (){}, 
            ),
            
          ],
      ),
      body: 
        VarIndex != -1 ?
          PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Container(
            alignment: Alignment.center,
            child: Pages[0],
          ),
          Container(
            alignment: Alignment.center,
            child: Pages[1],
          ),
          Container(
            alignment: Alignment.center,
            child: Pages[2],
          ),
          Container(
            alignment: Alignment.center,
            child: Pages[3],
          ),
        ],
      )
        :
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Container(
                alignment: Alignment.center,
                child: PersonalScreen(ObjUser: Obj_User,),
              ),
            ]
          ),  

      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              //color: Colors.black.withOpacity(0.2),
              offset: Offset(0,4),
              blurRadius: 8.0
            ),
          ],
        ),
        
        child: Container(
          color: Colors.black,
          height: 65,
          child: Column(
            children: [
              
              Container(
                height: 45,
                child: Row(
                  children: [
                    WaterDropNavBar(
                          backgroundColor: Colors.black,
                          onItemSelected: (int index) {
                            setState(() {
                              VarIndex = index;
                            });
                            
                            pageController.animateToPage(
                              VarIndex,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.easeOutQuad,
                            );  
                          },
                          selectedIndex: VarIndex,
                          waterDropColor: Colors.orange,
                          inactiveIconColor: Colors.white,
                          iconSize: 25,
                          //iconSize: 30,
                          //iconSize: 33,
                          bottomPadding: 1,
                          barItems: <BarItem>[
                            BarItem(
                              filledIcon: Icons.home_rounded,
                              outlinedIcon: Icons.home_outlined,
                            ),
                            BarItem(
                                filledIcon: Icons.monetization_on,
                                outlinedIcon: Icons.monetization_on_outlined),
                            BarItem(
                              filledIcon: Icons.access_time_filled_outlined,
                              outlinedIcon: Icons.access_time,
                            ),
                            BarItem(
                                filledIcon: Icons.medication_rounded,
                                outlinedIcon: Icons.medication_outlined
                            ),//   .favorite_border_rounded),
                          ],
                        ),
                  ],
                ),
                  
              ),
             
              //SizedBox(height: 1,),
             
              Container(
                //height: 2,
                //color: Colors.red,
                //width: 220,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(width: 0.1,),
                      Text('Inicio', style: TextStyle(color: VarIndex == 0 ? Colors.orange[700] : Colors.white, fontSize: 12),),
                      SizedBox(width: 0.05,),
                      Text('Finanzas', style: TextStyle(color: VarIndex == 1 ? Colors.orange[700] : Colors.white, fontSize: 12),),
                      SizedBox(width: 1,),
                      Text('Tiempo', style: TextStyle(color: VarIndex == 2 ? Colors.orange[700] : Colors.white, fontSize: 12),),
                      SizedBox(width: 1,),
                      Text('Salud', style: TextStyle(color: VarIndex == 3 ? Colors.orange[700] : Colors.white, fontSize: 12),),
                      //SizedBox(width: 1,),
                    ],
                  ),
              ),
              //SizedBox(height: 1,),
            ],
          ),
                
        ),
        
      ),
  
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 66,
        height: 66,
        child: FloatingActionButton(
          child: Icon(Icons.add_shopping_cart,size: 35,),
          backgroundColor: Colors.red,
          onPressed: (){},
        ),
      ),
      
    ),
  );

}
/*
class HomeScreen extends StatelessWidget{
  static const String routerName = 'home';
  String OpcionMenu = '';
  bool esHome = true;
  bool esFinanza = true;
  int VarIndex = 0;

  Widget _bottomAction(IconData icon){
    
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          icon, 
          color: Colors.grey[350],// Colors.orange[700] : Colors.grey[350],
          size:30,
        ),
      ),
      onTap: (){

      },
    );
  }

  
  @override
  Widget build(BuildContext context){
    final HeightPantalla = MediaQuery.of(context).size.height;
    print(VarIndex);

     return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.orange[700],
        title: IconButton(icon: Icon(Icons.person),onPressed: (){}, ),
        elevation: 0,
        actions: [
          Positioned(child: Image(image: AssetImage('assets/LogoBlanco.png'), alignment: Alignment.centerRight, width: 157, )),
          SizedBox(width: 80),
          IconButton(
            icon: Icon(Icons.campaign_outlined),
            color: Colors.white,
            tooltip: 'Anuncios',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none_rounded),
            color: Colors.white,
            tooltip: 'Notificaciones',
            onPressed: (){}, 
          ),
          
        ],
      ),
      
      body: ContainerPage(),
      
      /*SingleChildScrollView(
        //child: ContainerPrincipal(esHome,esFinanza),
        child: Pages[VarIndex],//Validar bien
      ),
    */
      
      bottomNavigationBar: ContainerTabBar(),

      /*
      BottomAppBar(
        color: Colors.black,        
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _bottomAction(Icons.home),
            _bottomAction(Icons.money),
            SizedBox(width: 48.0,),
            _bottomAction(Icons.timer_rounded),
            _bottomAction(Icons.medication),
        ]),
      ),
      */
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart,size: 27,),
        backgroundColor: Colors.red,
        onPressed: (){},
      ),
    
    );
  }
}

*/
class ContainerPrincipal extends StatefulWidget{
  String OpcMenu = '';
  bool esHome = true;
  bool esFinanza = true;

  ContainerPrincipal(bool EsHome, bool EsFinanza){
    
    esHome = EsHome;
    esFinanza = EsFinanza;
  }

  @override
  ContainerPrincipalState createState() => ContainerPrincipalState(esHome,esFinanza);
  

}

class ContainerPrincipalState extends State<ContainerPrincipal> with SingleTickerProviderStateMixin{

  ScrollController _controller = new ScrollController();
  double scrollAnterior = 0;
  double HeighByMenu = 0;
   
  String Var_Opcion_Menu = '';
  bool MuestraBotonesMenu = false;
  bool esHome = true;
  bool esFinanza = true;

  ContainerPrincipalState(bool EsHome, bool EsFinanza){
    esHome = EsHome;
    esFinanza = EsFinanza;
    if(Var_Opcion_Menu == ''){
      HeighByMenu = 120;
    }
    else{
      HeighByMenu = 40;
    }
  }

  AnimationController? _animationController;
  Animation? _animation;



  @override
  void initState(){
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!);

    super.initState();
    _animationController!.addListener(() {
      setState(() {
        
      });
    });
  }

  double getRadianFromDegree(double degree){
    double unitRadian = 57.295779513;
    return degree/unitRadian;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
    return Column(
            children: [
              CardSwiper(),
              Row(
              children: [
                SizedBox(width: 17,),
                Text('Favoritos', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(width: 15),
                IconButton(
                  icon: Icon(Icons.settings_outlined),
                  tooltip: 'Configuración',
                  onPressed: (){},
                ),
              ],
            ),

              MenuFavoritos(),
              
             // MenuContainer(esHome,esFinanza),
            
              if(!MuestraBotonesMenu)
                SizedBox(height: 200),
                

/*Menú de botones flotantes

              if(MuestraBotonesMenu)
              Transform.translate(
                      offset: Offset.fromDirection(getRadianFromDegree(88),_animation!.value *(100)),
                      child: CircularButton(
                      color: Colors.blue,
                          width: 50,//70,
                          height: 57,
                          icon: Icon(Icons.group, color: Colors.white),
                          onClic: (){
                            
                          },
                    ),
                  ),
            

              if(MuestraBotonesMenu)
              Transform.translate(
                      offset: Offset.fromDirection(getRadianFromDegree(54), _animation!.value * (105)),
                      child: CircularButton(
                      color: Colors.green,
                          width: 50,//70,
                          height: 57,
                          icon: Icon(Icons.translate, color: Colors.white),
                          onClic: (){
                            
                          },
                    ),
                ),
            
    
              if(MuestraBotonesMenu)
              Transform.translate(
                      offset: Offset.fromDirection(getRadianFromDegree(55), _animation!.value *(115)),
                      child: CircularButton(
                        color: Colors.orange,
                            width: 50,//70,
                            height: 57,
                            icon: Icon(Icons.person, color: Colors.white),
                            onClic: (){
                              print('Entra');
                            },
                      ),
                    ),

              Container(
                      decoration: BoxDecoration(
                        color: !MuestraBotonesMenu ? Colors.orange[600] : Colors.red, 
                        shape: BoxShape.circle),
                      width: 50,//70,
                      height: 57,
                      child: IconButton(
                        icon: Icon(!MuestraBotonesMenu ? Icons.payment : Icons.close, 
                        color: Colors.white
                      ),
                      enableFeedback: true, 
                      onPressed: (){
                        if(_animationController != null){
                            bool IsCompleted = _animationController!.isCompleted;
                                
                            if(IsCompleted){
                              _animationController?.reverse();
                              MuestraBotonesMenu = false;
                              HeighByMenu = 120;
                            }
                            else {
                              _animationController?.forward();
                              MuestraBotonesMenu = true;
                              HeighByMenu = 0;
                            }
                          }
                       },)
                ),
                
           */
              
              //BotonFlotanteLocal(),

/*
              if(!MuestraBotonesMenu)
                SizedBox(height: 12),
*/

/*
              if(MuestraBotonesMenu)
                SizedBox(height: 40),

              _MenuBajoLocal(),
              */
              SizedBox(height: 40),
        ],
        );
    }

}

class _MenuFavoritosLocal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  final widthPantalla = MediaQuery.of(context).size.width;
  return Positioned(
            bottom: 7,            
            child: Container(              
              width: widthPantalla,
              child: Align(
                child: MenuFavoritos(), 
                ),
            ) //         
          );
  }
}

class _MenuBajoLocal extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
  final widthPantalla = MediaQuery.of(context).size.width;   
   
    return Positioned(
            bottom: 20,            
            child: Container(              
              width: widthPantalla,
              child: Align(
                child:
                  MenuBajo(0),
                ),
            ) //         
          );
  }
}

class BotonFlotanteLocal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  final widthPantalla = MediaQuery.of(context).size.width;
    return Positioned(
            bottom: 7,
            child: Container(              
              width: widthPantalla,
              child: Align(
                child: BotonFlotante(), 
                alignment: Alignment.center,
              ),
            ) //         
          );
  }
}

class BotonFlotante extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: const FloatingActionButton(
          onPressed: null,
          tooltip: 'Agregar compra',
          child: Icon(Icons.add_shopping_cart, size: 30,), //ImagenesMemoria(Index: 1, RutaMemoria: 'assets/payment.jpg'),
          backgroundColor: Colors.red,
          autofocus: true,
          
          /*

            Container(
                      decoration: BoxDecoration(
                        color: !MuestraBotonesMenu ? Colors.orange[600] : Colors.red, 
                        shape: BoxShape.circle),
                      width: 70,
                      height: 57,
                      child: IconButton(
                        icon: Icon(!MuestraBotonesMenu ? Icons.payment : Icons.close, 
                        color: Colors.white
                      ),
                      enableFeedback: true, 
                      onPressed: (){
                        if(_animationController != null){
                            bool IsCompleted = _animationController!.isCompleted;
                                
                            if(IsCompleted){
                              _animationController?.reverse();
                              MuestraBotonesMenu = false;
                              HeighByMenu = 120;
                            }
                            else {
                              _animationController?.forward();
                              MuestraBotonesMenu = true;
                              HeighByMenu = 0;
                            }
                          }
                       },)
                ),
          
           */
        ),
    );
  }
}

class _MenuBajoModel with ChangeNotifier{
  bool _mostrar = true;
  bool get mostrar => this._mostrar;

  set mostrar (bool valor){
    this._mostrar = valor;
    notifyListeners();
  }

}

class MenuCircular extends StatefulWidget{
  @override
  _MenuCircularLocal createState() => _MenuCircularLocal();
}

class _MenuCircularLocal extends State<MenuCircular>{
  
  @override
  Widget build(BuildContext context) {
  final widthPantalla = MediaQuery.of(context).size.width;   
   
    return Positioned(
            bottom: 2,            
            child: Container(              
              width: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child:
                  CircularMenuPage(),
                ),
            ) //         
          );
  }
}


class ContainerTabBar extends StatefulWidget{

  @override
  ContainerTabBarState createState() => ContainerTabBarState();
 
}

class ContainerTabBarState extends State<ContainerTabBar>{

  int VarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Tab_Bar_Menu(
        VarIndex: VarIndex,
        OnChangeTab: OnChangeTab,
      );
  }

  void OnChangeTab (int Var_Index){
    setState(() {
      this.VarIndex = Var_Index;
    });
  }
}

