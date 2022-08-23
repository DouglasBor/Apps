


import 'dart:async';

import 'package:enroll_app/widgets/Menu/Menu_Circular/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:provider/provider.dart';
import 'dart:math';


class HomeMenu extends StatelessWidget{
  static const String routerName = 'homemenu';

  @override
  Widget build(BuildContext context){
    final HeightPantalla = MediaQuery.of(context).size.height;

     return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.orange[700],
        title: Icon(Icons.real_estate_agent_outlined),//IconButton(icon: Icon(Icons.real_estate_agent_outlined),onPressed: (){}, ),
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
      
      //drawer: const SideMenu(),
      /*
      body: Stack(
        children: <Widget>[
          CardSwiper(),
          _MenuBajoLocal(),
        ],
      ),
      */
      
      body: SingleChildScrollView(
        child: Container_Principal(),
      )
      
    
    );

  }
}

class Container_Principal extends StatefulWidget{
  String OpcMenu = '';

  @override
  Container_Principal_State createState() => Container_Principal_State();
  

}

class Container_Principal_State extends State<Container_Principal> with SingleTickerProviderStateMixin{

  ScrollController _controller = new ScrollController();
  double scrollAnterior = 0;
  double HeighByMenu = 0;
   
  String Var_Opcion_Menu = '';
  bool MuestraBotonesMenu = false;
   bool esHome = true;
     bool esFinanza = true;


  Container_Principal_State(){
    if(Var_Opcion_Menu == '' && !esHome){
      HeighByMenu = 120;
    }
    else{
      HeighByMenu = 40;
    }
    print(esHome);
              print(esFinanza);
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
              Home_Menu(),

              if(!MuestraBotonesMenu)
                SizedBox(height: 67),

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
                              //HeighByMenu = 120;
                            }
                            else {
                              _animationController?.forward();
                              MuestraBotonesMenu = true;
                              //HeighByMenu = 0;
                            }
                          }
                       },)
                ),
                
           
              //BotonFlotanteLocal(),
              if(!MuestraBotonesMenu)
                SizedBox(height: 12),

              if(MuestraBotonesMenu)
                SizedBox(height: 40),

              _MenuBajoLocal(),
              SizedBox(height: 40),
        ],
        );
    }

}

class Home_Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
            Row(
              children: [
                SizedBox(width: 17,),
                Text('Trámites solicitados', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),                
                SizedBox(width: 15),
                IconButton(
                  icon: Icon(Icons.document_scanner_outlined),
                  tooltip: 'Trámites',
                  onPressed: (){},
                ),
            ],),
         
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, int index) => _Home_Menu(index),
            ),
          )
        ],
      ),
    );
  }
}

class _Home_Menu extends StatelessWidget {

  int _Index = 0;
  _Home_Menu (int index){
    _Index = index;
  }

  @override
  Widget build(BuildContext context) {
    List<ImagenesMemoria> LstFavoritos = [
      ImagenesMemoria(Index: 0, RutaMemoria: 'assets/BtnProceso.png'),
      ImagenesMemoria(Index: 1, RutaMemoria: 'assets/BtnSalidas.png'),
      ImagenesMemoria(Index: 2, RutaMemoria: 'assets/BtnAprobado.png')
    ];
    final ListaImagenesMemoria = LstFavoritos[_Index];
    return Container(
                  width: 120,
                  height: 75,
                  //color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(

                    children: [
                       
                      FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'), 
                        //image: NetworkImage('https://via.placeholder.com/1900x1220'),
                        image: AssetImage(ListaImagenesMemoria.RutaMemoria!),
                        
                        width: 121,
                        height: 85,
                        
                        )
                    ]),
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
      child: FloatingActionButton(
          onPressed: null,
          tooltip: 'Agregar compra',
          child: const Icon(Icons.add_shopping_cart, size: 30,),
          backgroundColor: Colors.red,
          autofocus: true
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

