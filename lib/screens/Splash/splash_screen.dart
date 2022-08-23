import 'dart:io';

import 'package:enroll_app/helpers/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intro_slider/intro_slider.dart';

class SplashScreen extends StatefulWidget {

  static const String routerName = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  List<Widget> renderLstCustomTabs(){
    List<Widget> LstTabs = [
      Container(
        width: double.infinity, 
        height: double.infinity, 
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv1.png'),
             fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 22,),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(''),
                    MaterialButton(
                      shape: CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(child: Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
          ]
        ),
      ),
      
      Container(
        width: double.infinity, 
        height: double.infinity, 
        //child: Image.asset('assets/SplBnv2.png',matchTextDirection: true,height: 60,),
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv2.png'),
             fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 22,),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(''),
                    MaterialButton(
                      shape: CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(child: Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
          ]
        ),
      ),
      
      Container(
        width: double.infinity, 
        height: double.infinity, 
        //child: Image.asset('assets/SplBnv3.png',matchTextDirection: true,height: 60,),
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/SplBnv3.png'),
             //image: Image.network('assets/LogoRiaseme.svg'),
             fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 22,),
            
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(''),
                    MaterialButton(
                      shape: CircleBorder(),
                      disabledColor: Colors.white,
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(child: Icon(Icons.close,color: Colors.white,size: 30,),),
                      onPressed: () => exit(0), 
                    ),
                ],
            ),
          
            //SizedBox(height: 10,),

            Expanded(
            child: Container(
                //color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("", style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ]))), // Text Top

            Expanded(
                child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                      //color: Colors.red,
                      child: const Center(
                          child: Text("",
                              style: TextStyle(fontSize: 25.0))))),
                Expanded(
                  child: Container(
                      //color: Colors.yellow,
                      child: const Center(
                          child: Text("",
                              style: TextStyle(fontSize: 25.0))))),
            ])), //Row 1/2

            Expanded(
                child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                      //color: Colors.green,
                      child: const Center(
                          child: Text("",
                              style: TextStyle(fontSize: 25.0))))),
            ])), //Row 2/2
        
            Expanded(
                child: 
                  Center(
                    child: Column(
                      children: [
                         Container(
                          width: 352, // ancho para el botón
                          height: 52, // alto para el botón
                          child: 
                            MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                disabledColor: Colors.grey,
                                elevation: 10,
                                color: Colors.orange[900],
                                child: Container(child: const Text('QUIERO SUSCRIBIRME',style: TextStyle(color: Colors.white, fontSize: 15))),
                                onPressed: () {
                                  /* //Udemy pero sirve solo para las salidas de las pantallas
                                  RouteTransitions(
                                    context: context,
                                    child: TipoIdentificacionScreen(),
                                    animation: AnimationType.fadeIn,
                                    duration: Duration( milliseconds: 20 ),
                                    replacement: false
                                  );
                                  */
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                  );
                                }
                                /*
                                => Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                            ),

                                            */
                                //Navigator.push(context, MaterialPageRoute(builder: (context) =>  TipoIdentificacionScreen())),
                                /*
                                {
                                            //Navigator.pushReplacementNamed(context, 'tipoidentificacion');
                                        //Navigator.pushReplacementNamed(context, TipoIdentificacionScreen.routerName);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  TipoIdentificacionScreen()));
                                        //Navigator.pushNamed(context, TipoIdentificacionScreen.routerName);
                                            
                                            /*
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                            );
                                            */

                                            /*
                                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                                              return TipoIdentificacionScreen();
                                            }));
                                            */

                                            //Navigator.of(context).pushNamed('tipoidentificacion');
                                            
                                          },
                                          */
                            ),
                         ),

                        const SizedBox(height: 15,),

                        Container(
                          width: 500, // tamaño para la línea
                          child: Divider(
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                  child: Container(child: Text('INICIAR SESIÓN',style: TextStyle(color: Colors.white, fontSize: 15))),
                                  onPressed: (){

                                    /*
                                    RouteTransitions(
                                    context: context,
                                    child: AuthenticationScreen(),
                                    animation: AnimationType.normal,
                                    duration: Duration( milliseconds: 20 ),
                                    replacement: true
                                  );
                                  */


                                    //Navigator.pushReplacementNamed(context, LoginScreen.routerName);
                                    //Navigator.pushReplacementNamed(context, 'login');

                                    
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) => AuthenticationScreen()),
                                    );
                                    
                                  },
                                  
                                ),
                                    
                                    ]
                                  ),
                            ]
                        ),
                        const SizedBox(height: 20,),
                    ],)
                  
                ),
              ),  
           
           /*
             Center(
               child: Row(
                  children: [
                       MaterialButton(
                                    child: Container(child: Text('Iniciar Sesión',style: TextStyle(color: Colors.white, fontSize: 15))),
                                    onPressed: (){
                                      //Navigator.pushReplacementNamed(context, LoginScreen.routerName);
                                      Navigator.pushReplacementNamed(context, 'login');

                                      /*
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginScreen()),
                                      );
                                      */
                                    },
                                    
                                  ),
                                  
           
                  ],
            ),
             ),
           
           */
          ],
        ),
      ),
    ];

    return LstTabs;
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeScreen = MediaQuery.of(context).size;
    return IntroSlider(
      autoScroll: true,
      backgroundColorAllSlides: Colors.black,
      /*
      renderSkipBtn: Text('Saltar', style: TextStyle(color:  Colors.black),),
      renderNextBtn: Text('Siguiente', style: TextStyle(color:  Colors.black),),
      renderDoneBtn: Text('Hecho', style: TextStyle(color:  Colors.black)),
      */
      renderSkipBtn: Text('', style: TextStyle(color:  Colors.black),),
      renderNextBtn: Text('', style: TextStyle(color:  Colors.black),),
      renderDoneBtn: Text('', style: TextStyle(color:  Colors.black)),
      colorDot: Colors.white,
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderLstCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
      onDonePress: ()=> print('navegar'),
    );
  }


}

/*

final pages = [
    PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: Image.asset('assets/air-hostess.png'),
      body: const Text(
        'Hassle-free  booking  of  flight  tickets  with  full  refund  on  cancellation',
      ),
      title: const Text(
        'Flights',
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'assets/airplane.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/waiter.png',
      body: const Text(
        'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
      ),
      title: const Text('Hotels'),
      mainImage: Image.asset(
        'assets/hotel.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.orange,
              Colors.pinkAccent,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'assets/taxi-driver.png',
      body: const Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
      ),
      title: const Text('Cabs'),
      mainImage: Image.asset(
        'assets/taxi.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            // Use Navigator.pushReplacement if you want to dispose the latest route
            // so the user will not be able to slide back to the Intro Views.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

 */