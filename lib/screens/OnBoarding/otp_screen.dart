import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/Animations/FadeAnimation.dart';
import 'package:enroll_app/eventos_widgets/index.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

/*
class OtpScreen extends StatefulWidget {
  ProspectoType? Obj_Prosp;
  OtpScreen(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
  }

  static const String routerName = 'otponboarding';
  @override
  _OtpScreen createState() => _OtpScreen(Obj_Prosp!);

}

class _OtpScreen extends State<OtpScreen> with TickerProviderStateMixin{
  
  ProspectoType? Obj_Prosp;
  _OtpScreen(ProspectoType ObjProsp){
    Obj_Prosp = ObjProsp;
  }

  List<Color> LstColores = [
    Color.fromARGB(31, 0, 0, 0),
    Color.fromARGB(66, 0, 0, 0),
  ];

  AnimationController? _scaleController;
  AnimationController? _scale2Controller;
  AnimationController? _widthController;
  AnimationController? _positionController;

  Animation<double>? _scaleAnimation;
  Animation<double>? _scale2Animation;
  Animation<double>? _widthAnimation;
  Animation<double>? _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0, end: 0.8
    ).animate(_scaleController!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _widthController!.forward();
      }
    });

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );

    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300.0
    ).animate(_widthController!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _positionController!.forward();
      }
    });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );

    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 215.0
    ).animate(_positionController!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          hideIcon = true;
        });
        _scale2Controller!.forward();
      }
    });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );


    _scale2Animation = Tween<double>(
      begin: 1.0,
      end: 32.0
    ).animate(_scale2Controller!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: VerificationOtpScreen(Obj_Prosp:Obj_Prosp)));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final SizeScreen = MediaQuery.of(context).size;

    return 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        
        body: Center(
            child: Container(
              
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/OtpPage.png'), 
                      fit: BoxFit.cover,
                    ),
              ),
              
              child: ContainerGeneral(Obj_Prosp!,
               _scaleController!,
              _scale2Controller!,
              _widthController!,
              _positionController!,
              _scaleAnimation!,
              _scale2Animation!,
              _widthAnimation!,
              _positionAnimation!
              ),
              /*
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //VerificationCo
                ],
              ),
              */
              
            ),
          ),
      ),
    )
;
     
  }
}

class ContainerGeneral extends StatelessWidget {

  AnimationController? _scaleController;
  AnimationController? _scale2Controller;
  AnimationController? _widthController;
  AnimationController? _positionController;

  Animation<double>? _scaleAnimation;
  Animation<double>? _scale2Animation;
  Animation<double>? _widthAnimation;
  Animation<double>? _positionAnimation;

  bool hideIcon = false;

  String NombreDuenio = '';


  ProspectoType? Obj_Prosp;

  ContainerGeneral(ProspectoType ObjProsp,AnimationController _scale_Controller,AnimationController _scale2_Controller,AnimationController _width_Controller,AnimationController _position_Controller,
   Animation<double> _scale_Animation,Animation<double> _scale2_Animation,Animation<double> _width_Animation,Animation<double> _position_Animation){

    _scaleController = _scale_Controller;
    _scale2Controller = _scale2_Controller;
    _widthController = _width_Controller;
    _positionController = _position_Controller;
    _scaleAnimation = _scale_Animation;
    _scale2Animation = _scale2_Animation;
    _widthAnimation = _width_Animation;
    _positionAnimation = _position_Animation;
    Obj_Prosp = ObjProsp;
    NombreDuenio = Obj_Prosp!.alias;
  }

  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {

    return Container(
              child: Column(
                children: <Widget>[
                    SizedBox(height: 45,),
                    Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                MaterialButton(
                                              shape: const CircleBorder(),
                                              disabledColor: Colors.white,
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child: Container(child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                              onPressed: () => Navigator.pushReplacement(
                                                        context,
                                                        CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                                      ),
                                              
                                          ),

                                const Text('Paso 2 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),


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
                      height: 155,
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

                     Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 60)),
                                          Text(NombreDuenio,textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 60)),
                                          Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 60)),
                                        ],
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
                      
                  const SizedBox(height: 40,),

                   
/*// cajas otp
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                            OtpForm(Nombre_Persona: NombreDuenio, Cedula_Persona: Var_Cedula,),
                         ]),

                         */
                    
                    const SizedBox(height: 20,),

                    FadeAnimation(1.6, AnimatedBuilder(
                                      animation: _scaleController!,
                                      builder: (context, child) => Transform.scale(
                                      scale: _scaleAnimation!.value,
                                      child: Center(
                                        child: AnimatedBuilder(
                                          animation: _widthController!,
                                          builder: (context, child) => Container(
                                            width: _widthAnimation!.value,
                                            height: 80,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.orange.withOpacity(.4)
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                _scaleController!.forward();
                                                 
                                              },
                                              child: Stack(
                                                children: <Widget> [
                                                  AnimatedBuilder(
                                                    animation: _positionController!,
                                                    builder: (context, child) => Positioned(
                                                      left: _positionAnimation!.value,
                                                      child: AnimatedBuilder(
                                                        animation: _scale2Controller!,
                                                        builder: (context, child) => Transform.scale(
                                                          scale: _scale2Animation!.value,
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: Colors.orange[700]
                                                            ),
                                                            //child: hideIcon == false ? Icon(Icons.arrow_forward_ios, color: Colors.white,) : Container(),
                                                            child: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                                                          )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    )),
                            
                  
                  /* // Reenviar  OTP
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            MaterialButton(
                                            child: Container(child: Text("Reenviar Sms",style: TextStyle(fontSize: 15.0, color: Colors.orange[700], decoration: TextDecoration.underline,))),
                                            onPressed: (){
                                              print('navegar');
                                              //Navigator.pushReplacementNamed(context, LoginScreen.routerName);
                                              //Navigator.pushReplacementNamed(context, 'login');

                                              /*
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => LoginScreen()),
                                              );
                                              */
                                            },
                                            
                                          )
                         ]),

                      */   
                  const  SizedBox(height: 38,),
                    

        ],
      ),
    );
  }
}
*/

class OtpScreen extends StatefulWidget {
  ProspectoType? Obj_Prosp;
  OtpScreen(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
  }

  static const String routerName = 'otponboarding';
  @override
  _OtpScreen createState() => _OtpScreen(Obj_Prosp!);

}

class _OtpScreen extends State<OtpScreen> with TickerProviderStateMixin{
  ProspectoType? ObjProspecto;
  ProspectoType? Objeto_Prosp_;
  String Var_Coordenadas = '';
  ProspectoType? ObjetoProspecto;
  String NombreDuenio = '';

  ProspectoType? Obj_Prosp;
  _OtpScreen(ProspectoType ObjProsp){
    Obj_Prosp = ObjProsp;
    NombreDuenio = Obj_Prosp!.alias;
  }

  TextEditingController _Controller = TextEditingController();
  AnimationController? _scaleController;
  AnimationController? _scale2Controller;
  AnimationController? _widthController;
  AnimationController? _positionController;

  Animation<double>? _scaleAnimation;
  Animation<double>? _scale2Animation;
  Animation<double>? _widthAnimation;
  Animation<double>? _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    _Controller = TextEditingController();
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0, end: 0.8
    ).animate(_scaleController!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _widthController!.forward();
      }
    });

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );

    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300.0
    ).animate(_widthController!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _positionController!.forward();
      }
    });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );

    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 215.0
    ).animate(_positionController!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          hideIcon = true;
        });
        _scale2Controller!.forward();
      }
    });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );


    _scale2Animation = Tween<double>(
      begin: 1.0,
      end: 32.0
    ).animate(_scale2Controller!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PassWordScreen(Obj_Prosp: Objeto_Prosp_)));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final clienteForm = Provider.of<ProspectoTypeService>(context);
    final double width = MediaQuery.of(context).size.width;
    Container IconoSeleccionado;
    clienteForm.tieneUbicacion = CoordenadasRes;
    Color ColorBotonOpacidad;

    if(clienteForm.tieneUbicacion){
      ColorBotonOpacidad = Colors.orange.withOpacity(.4);
     IconoSeleccionado = Container(color: Colors.transparent, child: const Icon(Icons.check, color: Colors.green, size: 37,));

    }
    else{
      ColorBotonOpacidad = Colors.grey.withOpacity(.4);
      IconoSeleccionado = Container();
    }
   
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        
        child: Center(
          
          child: ChangeNotifierProvider(
            
                  create: (_) => ClienteFormService(),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                        image: AssetImage('assets/VerificacionOtp.png'), 
                        fit: BoxFit.cover,
                      ),
                    ),  
                    child: Form(
                      
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
                  child: Stack(
                    
                    children: <Widget>[
                      Center(
                        child: Container(
                          //padding: const EdgeInsets.all(20.0),
                         // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
          
                                const SizedBox(height: 25,),
          
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                                  shape: const CircleBorder(),
                                                  disabledColor: Colors.white,
                                                  elevation: 0,
                                                  color: Colors.transparent,
                                                  child:  Container(color: Colors.transparent, child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                                  onPressed: () => Navigator.pushReplacement(
                                                                      context,
                                                                      CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                                  ),
                                              ),
      
                                    const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),
      
                                    MaterialButton(
                                                      shape: const CircleBorder(),
                                                      disabledColor: Colors.white,
                                                      elevation: 0,
                                                      color: Colors.transparent,
                                                      child: Container(color: Colors.transparent, child: const Icon(Icons.close,color: Colors.white,size: 30,),),
                                                      onPressed: () => //print('Salir')
                                                        exit(0), 
                                                    ),
                                            
                                  ],
                                ),

                                const SizedBox(height: 70,),

                                Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 1)),
                                          Text('Hola $NombreDuenio!',textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 50)),
                                          Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.orange[700], fontSize: 1)),
                                        ],
                                ),

                                const SizedBox(height: 7,),

                                Container(
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width - 57,
                                child: Center(
                                  child: const AutoSizeText(
                                    'Ingresa el código de verificación enviado por SMS o correo electrónico',
                                    style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold,),
                                    maxLines: 3,
                                    minFontSize: 10,
                                    presetFontSizes: [25, 22, 20, 18, 16, 14],
                                  ),
                                ),
                              ),

                                
                      const SizedBox(height: 30,),
                      
                      Row(
                        children: const [
                          Expanded(
                            child: Image(
                              image: AssetImage('assets/IcOtp.png'), 
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 45,),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('',style: TextStyle(color: Colors.white, fontSize: 1),),
                            ChangeNotifierProvider(
                              create: (_) => OtpService(),
                              child: OtpForm(Obj_Prosp),
                            ),
                            const Text('',style: TextStyle(color: Colors.white, fontSize: 1),),
                            ],
                          ),
                      ),

                                     const SizedBox(height: 25,),

                              ],
                            ),
                          ),
                        
                        ),
                      )
                    ],
                  ),
                ),
      ),
    ),

          
          ),
        ),
      ),
    );
  }
}
