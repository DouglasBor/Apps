/*
import 'dart:io';
import 'package:enroll_app/Animations/FadeAnimation.dart';
import 'package:enroll_app/eventos_widgets/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PassWordScreen extends StatefulWidget {

  static const String routerName = 'passwordscreen';
  @override
  _PassWordScreen createState() => _PassWordScreen();

}

class _PassWordScreen extends State<PassWordScreen> with TickerProviderStateMixin{
  
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
      duration: Duration(milliseconds: 300)
    );

    _scale2Animation = Tween<double>(
      begin: 1.0,
      end: 32.0
    ).animate(_scale2Controller!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginScreen()));
        
        Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final SizeScreen = MediaQuery.of(context).size;
    //final loginForm = Provider.of<LoginFormService>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/PassWordCreate.png'), 
                        fit: BoxFit.cover,
                      ),
                  ),  
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.all(20.0),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
      
                    SizedBox(height: 30,),
      
                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                      shape: CircleBorder(),
                                      disabledColor: Colors.white,
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: Container(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                      onPressed: () => Navigator.pushReplacement(
                                                          context,
                                                          CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen()),
                                                        ),
                                      //Navigator.of(context, rootNavigator: true).pop(context),
                                      
                                  ),


                              Text('Paso 4 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),


                              MaterialButton(
                                          shape: CircleBorder(),
                                          disabledColor: Colors.white,
                                          elevation: 0,
                                          color: Colors.transparent,
                                          child: Container(child: Icon(Icons.close,color: Colors.white,size: 30,),),
                                          onPressed: () => //print('Salir')
                                            exit(0), 
                                        ),
                                
                            ],
                        ),

                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 80,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(),
                                                  ],),                        
                                                ),
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

                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 80,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(),
                                                  ],),                        
                                                ),
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
                   

                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 80,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(),
                                                            //SizedBox(height: 50,),
                                                          ],),
                                                ),
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

                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),

                              Text('¿Cuál quieres que sea', style: TextStyle(color: Colors.white, fontSize: 20),),

                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),
                                
                            ],
                    ),

                


                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),

                              Text('tu contraseña?', style: TextStyle(color: Colors.white, fontSize: 20),),

                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),
                                
                            ],
                    ),
      
                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 80,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(
                                                                            height: 130,
                                                                            width: 326,//360,
                                                                            //child: FrmDatosPersonales(),
                                                                            
                                                                  child: TextFormField(
                                                                        autocorrect: false,
                                                                        style: const TextStyle(color: Colors.white),
                                                                        //obscureText: loginForm.IsOscured,
                                                                        //keyboardType: loginForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                                        textInputAction: TextInputAction.done,
                                                                        decoration: InputDecorations.authInputDecoration(
                                                                          TamanioIcono: 20,
                                                                          EsContrasenia: true,
                                                                          colorBordes: Colors.white,
                                                                          hintText: '*****',
                                                                          labelText: 'Contraseña',
                                                                          prefxIcon: Icons.lock_outline,
                                                                          
                                                                          colorTexto: Colors.white,
                                                                          sufixIcon: Icons.visibility_off,//loginForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                                          OnPress: () {
                                                                            //loginForm.IsOscured = !loginForm.IsOscured;
                                                                          },
                                                                          
                                                                        ),
                                                                        //onChanged: (value) => loginForm.PassWord = value,
                                                                        validator: (value) {
                                                                          if(value != null && value.length >= 1 ) {
                                                                            return null;
                                                                          }
                                                                          return 'Ingrese contraseña';
                                                                        },
                                                                      ),
                                                                
                                                      ),                                  
                                                  ],),                        
                                                ),
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
                  
                       
                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 45,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Row(children: [
                                                  Text('Ingresala otra vez', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                ]
                                              ),
      
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
                   
                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 80,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(
                                                                            height: 130,
                                                                            width: 326,//360,
                                                                            //child: FrmDatosPersonales(),
                                                                            
                                                                  child: TextFormField(
                                                                        autocorrect: false,
                                                                        style: const TextStyle(color: Colors.white),
                                                                        //obscureText: loginForm.IsOscured,
                                                                        //keyboardType: loginForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                                        textInputAction: TextInputAction.done,
                                                                        decoration: InputDecorations.authInputDecoration(
                                                                          TamanioIcono: 20,
                                                                          EsContrasenia: true,
                                                                          colorBordes: Colors.white,
                                                                          hintText: '*****',
                                                                          labelText: 'Contraseña',
                                                                          prefxIcon: Icons.lock_outline,
                                                                          
                                                                          colorTexto: Colors.white,
                                                                          sufixIcon: Icons.visibility_off,//loginForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                                          OnPress: () {
                                                                            //loginForm.IsOscured = !loginForm.IsOscured;
                                                                          },
                                                                          
                                                                        ),
                                                                        //onChanged: (value) => loginForm.PassWord = value,
                                                                        validator: (value) {
                                                                          if(value != null && value.length >= 1 ) {
                                                                            return null;
                                                                          }
                                                                          return 'Ingrese contraseña';
                                                                        },
                                                                      ),
                                                                
                                                      ),                                  
                                                  ],),                        
                                                ),
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
                   
                    
                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 10,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(),
                                                  ],),                        
                                                ),
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
                                padding: EdgeInsets.all(10),
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
                                                child: hideIcon == false ? Icon(Icons.arrow_forward_ios, color: Colors.white,) : Container(),
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
                    
                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),

                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),

                              Text('', style: TextStyle(color: Colors.white, fontSize: 20),),
                                
                            ],
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text('', style: TextStyle(color: Colors.white, fontSize: 20),),

                            Text('', style: TextStyle(color: Colors.white, fontSize: 20),),

                            Text('', style: TextStyle(color: Colors.white, fontSize: 20),),
                                
                        ],
                    ),

                    FadeAnimation(1.6, AnimatedBuilder(
                          animation: _scaleController!,
                          builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation!.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController!,
                              builder: (context, child) => Container(
                                //width: _widthAnimation!.value,
                                //color: Colors.white,
                                height: 110,
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController!,
                                        builder: (context, child) => Positioned(
                                          //left: _positionAnimation!.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller!,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation!.value,
                                              child: Expanded(
                                                        child: 
                                                          Row(children: [
                                                            Container(),
                                                  ],),                        
                                                ),
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
                   

                  ],
                ),
              
              )
            ],
          ),
        ),
      ),
    );

  }
}
*/

import 'dart:io';
import 'package:enroll_app/Animations/FadeAnimation.dart';
import 'package:enroll_app/eventos_widgets/index.dart';
import 'package:enroll_app/helpers/index.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:status_change/status_change.dart';

String FechaNacimientoOrigen = '';

class PassWordScreen extends StatefulWidget {

  String Clave = '';
  ProspectoType? Obj_Prosp;
  ProspectoType? Obj_Prospe_;

  PassWordScreen({required Obj_Prosp}){
    
    Obj_Prospe_ = Obj_Prosp;
    String FecNac = Obj_Prosp!.fechaNacimiento;
    FechaNacimientoOrigen = Obj_Prosp!.fechaNacimiento;
  }

  static const String routerName = 'contraseniascreen';
  @override
  //_ContraseniaScreen createState() => _ContraseniaScreen(VarClave: Clave);
  _ContraseniaScreen createState() => _ContraseniaScreen(Obj_Prosp_: Obj_Prospe_);

}

class _ContraseniaScreen extends State<PassWordScreen> with TickerProviderStateMixin{
  ProspectoType? Obj_Prosp_;
  ProspectoType? Obj_Prospec_;
  ProspectoType? Obj_Prosp;
  _ContraseniaScreen({required Obj_Prosp_}){
    Obj_Prospec_ = Obj_Prosp_;
     var ob = Obj_Prospec_!.apellidos;
     Obj_Prosp = Obj_Prosp_;
    print('Clave screen 2 -- $ob');
    
  }
  String VarClave = '';
  //_ContraseniaScreen({required VarClave});

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
  bool tieneMayuscula = false;
  bool tieneMinuscula = false;
  bool tieneNumero = false;
  bool tieneCaracterEspecial = false;
  bool tieneDiezCaracteres = false;
  bool hideIcon = false;
  bool nivelBajo = false;
  bool nivelIntermedioBajoMedioCuartaParte = false;
  bool nivelIntermedioBajoMedio = false;
  bool nivelMedio = false;
  bool nivelIntermedioMedioAlto = false;
  bool nivelAlto = false;
  bool VerValidaciones = false;

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
      duration: Duration(milliseconds: 300)
    );

    _scale2Animation = Tween<double>(                                                                                       
      begin: 1.0,
      end: 32.0
    ).animate(_scale2Controller!)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        
        //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: GenialPrevioInicioScreen(Obj_Prospec_)));
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BuscaCorreoScreen(Obj_Prospec_)));
        /*
         Future.microtask(() => 
                                        Navigator.of(context, rootNavigator: true).pushReplacementNamed(BuscaCorreoScreen.routerName,arguments: Obj_Prospec_),
                                      );
                                      */
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    final prospectoForm = Provider.of<ProspectoTypeService>(context);
    final SizeScreen = MediaQuery.of(context).size;
    String CedulaSelect = 'assets/BtnCedula_Blanco.png';
    String PasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
    final TextEditingController controller = TextEditingController();


    onPassWordChanged(String password) {
    print('Valor clave: $password');
    final numericRegex = RegExp(r'[0-9]');
    final mayusculaRegex = RegExp(r'[A-Z]');
    final minusculaRegex = RegExp(r'[a-z]');
    final caracterEspecialRegex = RegExp(r'[\u0021-\u002b\u003c-\u0040]');


    if(numericRegex.hasMatch(password)) {
      tieneNumero = true;
    } else {
        tieneNumero = false;
    }

    if(mayusculaRegex.hasMatch(password)){
      tieneMayuscula = true;
    } else {
      tieneMayuscula = false;
    }
        
    if(minusculaRegex.hasMatch(password)){
      tieneMinuscula = true;
    } else {
      tieneMinuscula = false;
    }

    if(caracterEspecialRegex.hasMatch(password)){
      tieneCaracterEspecial = true;
    } else {
      tieneCaracterEspecial = false;
    }

    if(password == '') {
      tieneNumero = false;
      tieneMayuscula = false;
      tieneMinuscula = false;
      tieneCaracterEspecial = false;
      nivelBajo = false;
      nivelMedio = false;
      nivelAlto = false;
      nivelIntermedioBajoMedio = false;
      nivelIntermedioMedioAlto = false;
      tieneDiezCaracteres = false;
    }
    else {
      if(password.length <= 8) {
        tieneDiezCaracteres = false;
        if(password.length >= 7 && password.length < 9) {
          /*
          if(password.length >= 7 && password.length <= 8){
            nivelIntermedioBajoMedioCuartaParte = true;
          }
          */
          nivelIntermedioBajoMedio = true;
        } else {
          nivelIntermedioBajoMedio = false;
        }
      nivelBajo = true;
      nivelMedio = false;
      nivelAlto = false;
    }
    else {
      if(password.length >= 9 && password.length <= 13) {
        tieneDiezCaracteres = false;
        if(password.length >= 10 && password.length < 14) {
          nivelIntermedioMedioAlto = true;
          tieneDiezCaracteres = true;
        } else {
          nivelIntermedioMedioAlto = false;
        }
      nivelMedio = true;
              nivelAlto = false;
            }
            else {
              if(password.length >= 14 && password.length <= 20) {
                nivelAlto = true;
              }
            }
          }

         

        }


      setState(() {
        
      });
    
    
  }
/*
    return  Scaffold(     
      
      backgroundColor: Colors.black, 
        body: Center(
          child: 
            /*
            ChangeNotifierProvider(
                      create: (_) => LoginFormService(),
                      //child: PaswordRegEvntLog(_scaleController!, _scale2Controller!, _widthController!, _positionController!, _scaleAnimation!, _scale2Animation!, _widthAnimation!, _positionAnimation!, Obj_Prospec_!),
                      child: Container(
                        
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/PassWordCreate.png'), 
                  fit: BoxFit.cover,
                ),
                      
                color: Colors.black
              ),
                        child: Form(
              //key: prospectoForm.FormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                      CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Obj_Prosp: Obj_Prosp)),
                                                    ),
                                  //Navigator.of(context, rootNavigator: true).pop(context),                                    
                              ),
            
                              Text('Paso 4 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
                                     
                              MaterialButton(
                                        shape: CircleBorder(),
                                        disabledColor: Colors.white,
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Container(child: const Icon(Icons.close,color: Colors.white,size: 39,),),
                                        onPressed: () => exit(0),                                   
                              ),                            
                            ],
                          ),
                            
                const Expanded(
                  child: Center(),
                ),
            
                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('¿Cuál quieres que sea', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            ],
                          ),
            
                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('tu contraseña?', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            ],
                          ),
            
                Container(
                            height: 100,
                            color: Colors.transparent,
                            child: Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, ),),
                                                                             
                                  Row(
                                    children: [
                                      Container(
                                          height: 90,
                                          width: SizeScreen.width - 110,//360,
                                          child: TextFormField(
                                            onTap: () {
                                                            setState(() {
                                                              VerValidaciones = true;
                                                            });
                                                          },
                                            style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                          autocorrect: false,
                                                          obscureText: prospectoForm.IsOscured,
                                            maxLength: 20,
                                            keyboardType: prospectoForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                            textInputAction: TextInputAction.done,
                                            decoration: InputDecorations.authInputDecoration(
                                                            TamanioIcono: 20,
                                                            EsContrasenia: true,
                                                            hintText: '*****',
                                                            labelText: 'Contraseña',
                                                            prefxIcon: Icons.lock_outline,
                                                            colorBordes: Colors.white,
                                                            colorTexto: Colors.white,
                                                            sufixIcon: prospectoForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                              OnPress: () {
                                                                prospectoForm.IsOscured = !prospectoForm.IsOscured;
                                                              },
                                                          ),
                                          //onChanged: (value) => prospectoForm.PassWord = value,
                                          onChanged: ((value) {
                                            prospectoForm.PassWord = value;
                                            onPassWordChanged(value.toString());
                                            
        
                                          }),
                                          validator: (value) {
                                            //onPassWordChanged(value.toString());
                                            
                                                            String MensajeValidacion = '';
                                                            if(value != null) {
                                                              if(value.length < 10){
                                                                MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                              }
                                                            }
                                                            return MensajeValidacion;
                                                          },
                                        ),
                                      ),        
                                      
                                    ],
                                  ),
            
                                  const Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                              
                              ],),
            
                            ),
                          ),
        
                if(VerValidaciones)     
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.transparent,
                      width: 345,
                      height: 50,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 40,),
                              AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: nivelBajo ? Colors.red : Colors.transparent,
                                        border: nivelBajo ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(40),
                                        
                                      ),
                                    ),
                              Container(
                                color: Colors.transparent,
                                width: 90,
                                height: 10,
                                child: Row (
                                  children: <Widget>[
                                      Expanded(
                                        
                                          child: Container(
                                          decoration: 
                                            nivelIntermedioBajoMedio ?
                  
                                            const BoxDecoration(
                                              gradient:  LinearGradient(
                                              transform: GradientRotation(-227),
                                              colors: <Color>[
                                                          Colors.red,
                                                          Colors.orange
                                                          
                                                        ]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                            
                                            )
                  
                                            :
                  
                                            const BoxDecoration(
                                  gradient: LinearGradient(
                                  transform: GradientRotation(-360),
                                  colors: <Color>[
                                             Colors.white,
                                             Colors.transparent
                                              
                                            ]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                //color: Color(0xFFF4F4F4),
                                
                                ),
                                              child: Container(),
                                            )
                                        ),  
                                    ]
                                  ),
                                ),
                              
                              AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: nivelMedio ? Colors.orange : Colors.transparent,
                                        border: nivelMedio ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(40),
                                        
                                      ),
                                    ),
                              Container(
                                color: Colors.transparent,
                                width: 90,
                                height: 10,
                                child: Row (
                                  children: <Widget>[
                                      Expanded(
                                        
                                          child: Container(
                                          decoration: 
                                            nivelIntermedioMedioAlto ?
                  
                                            const BoxDecoration(
                                              gradient:  LinearGradient(
                                              transform: GradientRotation(-227),
                                              colors: <Color>[
                                                          Colors.orange,
                                                          Colors.green
                                                          
                                                        ]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                            
                                            )
                  
                                            :
                  
                                            const BoxDecoration(
                                  gradient: LinearGradient(
                                  transform: GradientRotation(-360),
                                  colors: <Color>[
                                             Colors.white,
                                              Colors.transparent
                                            ]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                //color: Color(0xFFF4F4F4),
                                
                                ),
                                              child: Container(),
                                            )
                                        ),  
                                    ]
                                  ),
                                ),
                              
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 12,
                                      height: 12,
                                decoration: BoxDecoration(
                                  color: nivelAlto ? Colors.green : Colors.transparent,
                                  border: nivelAlto ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(40),      
                                ),
                              ),
                            ]
                          ),
                  
                          const SizedBox(height: 3,),
                           
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 48,),
                              Text('Baja', style: TextStyle(color: nivelBajo ? Colors.red : Colors.white, fontSize: 12),),
                              Container(
                                color: Colors.transparent,
                                width: 98,
                                child: Row (
                                  children: const <Widget>[
                                     
                                  ]
                                ),
                              ),
                              Text('Media', style: TextStyle(color: nivelMedio ? Colors.orange : Colors.white, fontSize: 12),),
                              Container(
                                color: Colors.transparent,
                                width: 100,
                                child: Row (
                                  children: const <Widget>[
                                     
                                  ]
                                ),
                              ),
                              Text('Alta', style: TextStyle(color: nivelAlto ? Colors.green : Colors.white, fontSize: 12),),
                            ]
                          ),
                        ],
                      )),
                                ),
                  
        
                if(VerValidaciones)     
                  const SizedBox(height: 15,),
        
                if(VerValidaciones)     
                  SingleChildScrollView(
                    child: Column(
                              children: [ 
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('     Tu contraseña debe contener mínimo', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'bolt'),), 
                                  Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                ],
                              ),
                                
                  
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneMayuscula ? Colors.green : Colors.red,
                                      border: tieneMayuscula ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                      
                                    ),
                                    child: Center(child: Icon(tieneMayuscula ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Una mayúscula', style: TextStyle(color: !tieneMayuscula ? Colors.red : Colors.green, fontSize: 14),), 
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneMinuscula ? Colors.green : Colors.red,
                                      border: tieneMinuscula ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                      //tieneMinuscula
                                    ),
                                    child: Center(child: Icon(tieneMinuscula ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Una minúscula', style: TextStyle(color: !tieneMinuscula ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneNumero ? Colors.green : Colors.red,
                                      border: tieneNumero ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneNumero ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Un número', style: TextStyle(color: !tieneNumero ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneCaracterEspecial ? Colors.green : Colors.red,
                                      border: tieneCaracterEspecial ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneCaracterEspecial ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  Text('Un caracter especial', style: TextStyle(color: !tieneCaracterEspecial ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                              ],
                            ),
                  ),
                          
                const SizedBox(height: 50,),
                          
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                    Text('Ingresala otra vez', style: TextStyle(color: Colors.white, fontSize: 30),),  
                    Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                  ],
                ),
                          
                Container(
                            height: 95,
                            //color: Colors.white,
                            child: Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                                                    //SizedBox(width: 2,), 
                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                              //FrmDatosPersonales(),
                                                                             
                                  Row(
                                                                                //mainAxisAlignment: MainAxisAlignment.end,
                                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                                Container(
                                                        height: 90,
                                                        width: SizeScreen.width - 110,//360,
                                                        child: TextFormField(
                                                          onTap: () {
                                                            setState(() {
                                                              VerValidaciones = false;
                                                            });
                                                          },
                                                          style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                          autocorrect: false,
                                                          obscureText: prospectoForm.IsOscuredConfirm,
                                                            
                                                          keyboardType: prospectoForm.IsOscuredConfirm ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                          textInputAction: TextInputAction.done,
                                                          decoration: InputDecorations.authInputDecoration(
                                                            TamanioIcono: 20,
                                                            EsContrasenia: true,
                                                            hintText: '*****',
                                                            labelText: 'Confirma Contraseña',
                                                            prefxIcon: Icons.lock_outline,
                                                            colorBordes: Colors.white,
                                                            colorTexto: Colors.white,
                                                            sufixIcon: prospectoForm.IsOscuredConfirm ? Icons.visibility_off : Icons.visibility,
                                                              OnPress: () {
                                                                prospectoForm.IsOscuredConfirm = !prospectoForm.IsOscuredConfirm;
                                                              },
                                                          ),
                                                          onChanged: (value) => prospectoForm.PassWordConfirm = value,
                                                          validator: (value) {
                                                            
                                                            String MensajeValidacion = '';
                                                            if(value != null) {
                                                              if(value.length < 10){
                                                                MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                              }
                                                              /*
                                                              else{
                                                                //String pattern = r'^(?=.*[az])(?=.*[AZ])(?=.*\\d)”+“(?=.*[-+_!@#$%^&*.,?]).+$';
                                                                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                                RegExp regExp  = RegExp(pattern);
        
                                                                MensajeValidacion = regExp.hasMatch(value) ? '' : 'Clave debe tener una letra mayúscula y una minúscula';
                                                                
                                                              }
                                                              */
                                                            }
            
                                                            return MensajeValidacion;
                                                            
                                                          },
                                                        ),
                                            ),
                                            
                                             ],
                                  ),
            
                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                              
                              ],),
            
                            ),
                          ),
                          
                          const Expanded(
                            child: Center(),
                          ),
            
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
                                              onTap: () async {
                                                String Pass = prospectoForm.PassWord;
                                                print('Clave muestra: $Pass');
                                                if(prospectoForm.isValidFormPasword() && prospectoForm.isParamsForm()){
                                                    Obj_Prosp!.fechaNacimiento = FechaNacimientoOrigen;
        
                                                  await prospectoForm.registraProspecto(Obj_Prosp!);
        
                                                  showDialog(
                                                    context: context, 
                                                    builder: (context) => 
                                                      SimpleDialog(
                                                        alignment: Alignment.center,
                                                        children: [
                                                            SimpleDialogCargando(),
                                                            ]
                                                          ),
                                                  );
        
                                                  if(prospectoForm.ObjRspRegistro!.succeeded) {//&& prospectoForm.ObjTipoRsp!.statusCode == '000'){
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    _scaleController!.forward();
                                                  } else {
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    CustomBgAlertBox(
                                                      context: context,
                                                      title: 'Error al registrar al prospecto',
                                                      infoMessage: prospectoForm.ObjRspRegistro!.message,
                                                      buttonColor: Colors.red,
                                                      buttonText: 'Cerrar',
                                                      icon: Icons.cancel,
                                                      titleTextColor: Colors.red[400],
                                                  );
                                                  }
        
                                                }
                                                else {
                                                  String MsmValidacion = prospectoForm.MensajeError();
                                                  CustomBgAlertBox(
                                                      context: context,
                                                      title: 'UPS',
                                                      infoMessage: MsmValidacion,
                                                      buttonColor: Colors.red,
                                                      buttonText: 'Cerrar',
                                                      icon: Icons.cancel,
                                                      titleTextColor: Colors.red[400],
                                                  );
                                                }
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
                                                            child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
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
                                
                          const SizedBox(height:7,),
                        ],
                      ),
            ),
               
                      )
                    ),              
            */    
            
            
            
            Container(    
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/PassWordCreate.png'), 
                  fit: BoxFit.cover,
                ),
                      
                color: Colors.black
              ),
              child: ChangeNotifierProvider(
                      create: (_) => LoginFormService(),
                      //child: PaswordRegEvntLog(_scaleController!, _scale2Controller!, _widthController!, _positionController!, _scaleAnimation!, _scale2Animation!, _widthAnimation!, _positionAnimation!, Obj_Prospec_!),
                      child: Container(
                        child: Form(
              //key: prospectoForm.FormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                      CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Obj_Prosp: Obj_Prosp)),
                                                    ),
                                  //Navigator.of(context, rootNavigator: true).pop(context),                                    
                              ),
            
                              Text('Paso 4 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
                                     
                              MaterialButton(
                                        shape: CircleBorder(),
                                        disabledColor: Colors.white,
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Container(child: const Icon(Icons.close,color: Colors.white,size: 39,),),
                                        onPressed: () => exit(0),                                   
                              ),                            
                            ],
                          ),
                            
                const Expanded(
                  child: Center(),
                ),
            
                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('¿Cuál quieres que sea', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            ],
                          ),
            
                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('tu contraseña?', style: TextStyle(color: Colors.white, fontSize: 30),),  
                              Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            ],
                          ),
            
                Container(
                            height: 100,
                            color: Colors.transparent,
                            child: Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, ),),
                                                                             
                                  Row(
                                    children: [
                                      Container(
                                          height: 90,
                                          width: SizeScreen.width - 110,//360,
                                          child: TextFormField(
                                            onTap: () {
                                                            setState(() {
                                                              VerValidaciones = true;
                                                            });
                                                          },
                                            style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                          autocorrect: false,
                                                          obscureText: prospectoForm.IsOscured,
                                            maxLength: 20,
                                            keyboardType: prospectoForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                            textInputAction: TextInputAction.done,
                                            decoration: InputDecorations.authInputDecoration(
                                                            TamanioIcono: 20,
                                                            EsContrasenia: true,
                                                            hintText: '*****',
                                                            labelText: 'Contraseña',
                                                            prefxIcon: Icons.lock_outline,
                                                            colorBordes: Colors.white,
                                                            colorTexto: Colors.white,
                                                            sufixIcon: prospectoForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                              OnPress: () {
                                                                prospectoForm.IsOscured = !prospectoForm.IsOscured;
                                                              },
                                                          ),
                                          //onChanged: (value) => prospectoForm.PassWord = value,
                                          onChanged: ((value) {
                                            prospectoForm.PassWord = value;
                                            onPassWordChanged(value.toString());
                                            
        
                                          }),
                                          validator: (value) {
                                            //onPassWordChanged(value.toString());
                                            
                                                            String MensajeValidacion = '';
                                                            if(value != null) {
                                                              if(value.length < 10){
                                                                MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                              }
                                                            }
                                                            return MensajeValidacion;
                                                          },
                                        ),
                                      ),        
                                      
                                    ],
                                  ),
            
                                  const Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                              
                              ],),
            
                            ),
                          ),
        
                if(VerValidaciones)     
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.transparent,
                      width: 345,
                      height: 50,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 40,),
                              AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: nivelBajo ? Colors.red : Colors.transparent,
                                        border: nivelBajo ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(40),
                                        
                                      ),
                                    ),
                              Container(
                                color: Colors.transparent,
                                width: 90,
                                height: 10,
                                child: Row (
                                  children: <Widget>[
                                      Expanded(
                                        
                                          child: Container(
                                          decoration: 
                                            nivelIntermedioBajoMedio ?
                  
                                            const BoxDecoration(
                                              gradient:  LinearGradient(
                                              transform: GradientRotation(-227),
                                              colors: <Color>[
                                                          Colors.red,
                                                          Colors.orange
                                                          
                                                        ]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                            
                                            )
                  
                                            :
                  
                                            const BoxDecoration(
                                  gradient: LinearGradient(
                                  transform: GradientRotation(-360),
                                  colors: <Color>[
                                             Colors.white,
                                             Colors.transparent
                                              
                                            ]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                //color: Color(0xFFF4F4F4),
                                
                                ),
                                              child: Container(),
                                            )
                                        ),  
                                    ]
                                  ),
                                ),
                              
                              AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: nivelMedio ? Colors.orange : Colors.transparent,
                                        border: nivelMedio ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(40),
                                        
                                      ),
                                    ),
                              Container(
                                color: Colors.transparent,
                                width: 90,
                                height: 10,
                                child: Row (
                                  children: <Widget>[
                                      Expanded(
                                        
                                          child: Container(
                                          decoration: 
                                            nivelIntermedioMedioAlto ?
                  
                                            const BoxDecoration(
                                              gradient:  LinearGradient(
                                              transform: GradientRotation(-227),
                                              colors: <Color>[
                                                          Colors.orange,
                                                          Colors.green
                                                          
                                                        ]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                            
                                            )
                  
                                            :
                  
                                            const BoxDecoration(
                                  gradient: LinearGradient(
                                  transform: GradientRotation(-360),
                                  colors: <Color>[
                                             Colors.white,
                                              Colors.transparent
                                            ]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                //color: Color(0xFFF4F4F4),
                                
                                ),
                                              child: Container(),
                                            )
                                        ),  
                                    ]
                                  ),
                                ),
                              
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 12,
                                      height: 12,
                                decoration: BoxDecoration(
                                  color: nivelAlto ? Colors.green : Colors.transparent,
                                  border: nivelAlto ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(40),      
                                ),
                              ),
                            ]
                          ),
                  
                          const SizedBox(height: 3,),
                           
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 48,),
                              Text('Baja', style: TextStyle(color: nivelBajo ? Colors.red : Colors.white, fontSize: 12),),
                              Container(
                                color: Colors.transparent,
                                width: 98,
                                child: Row (
                                  children: const <Widget>[
                                     
                                  ]
                                ),
                              ),
                              Text('Media', style: TextStyle(color: nivelMedio ? Colors.orange : Colors.white, fontSize: 12),),
                              Container(
                                color: Colors.transparent,
                                width: 100,
                                child: Row (
                                  children: const <Widget>[
                                     
                                  ]
                                ),
                              ),
                              Text('Alta', style: TextStyle(color: nivelAlto ? Colors.green : Colors.white, fontSize: 12),),
                            ]
                          ),
                        ],
                      )),
                                ),
                  
        
                if(VerValidaciones)     
                  const SizedBox(height: 15,),
        
                if(VerValidaciones)     
                  SingleChildScrollView(
                    child: Column(
                              children: [ 
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('     Tu contraseña debe contener mínimo', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'bolt'),), 
                                  Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                ],
                              ),
                                
                  
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneMayuscula ? Colors.green : Colors.red,
                                      border: tieneMayuscula ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                      
                                    ),
                                    child: Center(child: Icon(tieneMayuscula ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Una mayúscula', style: TextStyle(color: !tieneMayuscula ? Colors.red : Colors.green, fontSize: 14),), 
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneMinuscula ? Colors.green : Colors.red,
                                      border: tieneMinuscula ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                      //tieneMinuscula
                                    ),
                                    child: Center(child: Icon(tieneMinuscula ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Una minúscula', style: TextStyle(color: !tieneMinuscula ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneNumero ? Colors.green : Colors.red,
                                      border: tieneNumero ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneNumero ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Un número', style: TextStyle(color: !tieneNumero ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneCaracterEspecial ? Colors.green : Colors.red,
                                      border: tieneCaracterEspecial ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneCaracterEspecial ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  Text('Un caracter especial', style: TextStyle(color: !tieneCaracterEspecial ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                              ],
                            ),
                  ),
                          
                const SizedBox(height: 50,),
                          
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                    Text('Ingresala otra vez', style: TextStyle(color: Colors.white, fontSize: 30),),  
                    Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                  ],
                ),
                          
                Container(
                            height: 95,
                            //color: Colors.white,
                            child: Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                                                    //SizedBox(width: 2,), 
                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                              //FrmDatosPersonales(),
                                                                             
                                  Row(
                                                                                //mainAxisAlignment: MainAxisAlignment.end,
                                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                                Container(
                                                        height: 90,
                                                        width: SizeScreen.width - 110,//360,
                                                        child: TextFormField(
                                                          onTap: () {
                                                            setState(() {
                                                              VerValidaciones = false;
                                                            });
                                                          },
                                                          style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                          autocorrect: false,
                                                          obscureText: prospectoForm.IsOscuredConfirm,
                                                            
                                                          keyboardType: prospectoForm.IsOscuredConfirm ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                          textInputAction: TextInputAction.done,
                                                          decoration: InputDecorations.authInputDecoration(
                                                            TamanioIcono: 20,
                                                            EsContrasenia: true,
                                                            hintText: '*****',
                                                            labelText: 'Confirma Contraseña',
                                                            prefxIcon: Icons.lock_outline,
                                                            colorBordes: Colors.white,
                                                            colorTexto: Colors.white,
                                                            sufixIcon: prospectoForm.IsOscuredConfirm ? Icons.visibility_off : Icons.visibility,
                                                              OnPress: () {
                                                                prospectoForm.IsOscuredConfirm = !prospectoForm.IsOscuredConfirm;
                                                              },
                                                          ),
                                                          onChanged: (value) => prospectoForm.PassWordConfirm = value,
                                                          validator: (value) {
                                                            
                                                            String MensajeValidacion = '';
                                                            if(value != null) {
                                                              if(value.length < 10){
                                                                MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                              }
                                                              /*
                                                              else{
                                                                //String pattern = r'^(?=.*[az])(?=.*[AZ])(?=.*\\d)”+“(?=.*[-+_!@#$%^&*.,?]).+$';
                                                                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                                RegExp regExp  = RegExp(pattern);
        
                                                                MensajeValidacion = regExp.hasMatch(value) ? '' : 'Clave debe tener una letra mayúscula y una minúscula';
                                                                
                                                              }
                                                              */
                                                            }
            
                                                            return MensajeValidacion;
                                                            
                                                          },
                                                        ),
                                            ),
                                            
                                             ],
                                  ),
            
                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                              
                              ],),
            
                            ),
                          ),
                          
                          const Expanded(
                            child: Center(),
                          ),
            
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
                                              onTap: () async {
                                                String Pass = prospectoForm.PassWord;
                                                print('Clave muestra: $Pass');
                                                if(prospectoForm.isValidFormPasword() && prospectoForm.isParamsForm()){
                                                    Obj_Prosp!.fechaNacimiento = FechaNacimientoOrigen;
        
                                                  await prospectoForm.registraProspecto(Obj_Prosp!);
        
                                                  showDialog(
                                                    context: context, 
                                                    builder: (context) => 
                                                      SimpleDialog(
                                                        alignment: Alignment.center,
                                                        children: [
                                                            SimpleDialogCargando(),
                                                            ]
                                                          ),
                                                  );
        
                                                  if(prospectoForm.ObjRspRegistro!.succeeded) {//&& prospectoForm.ObjTipoRsp!.statusCode == '000'){
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    _scaleController!.forward();
                                                  } else {
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    CustomBgAlertBox(
                                                      context: context,
                                                      title: 'Error al registrar al prospecto',
                                                      infoMessage: prospectoForm.ObjRspRegistro!.message,
                                                      buttonColor: Colors.red,
                                                      buttonText: 'Cerrar',
                                                      icon: Icons.cancel,
                                                      titleTextColor: Colors.red[400],
                                                  );
                                                  }
        
                                                }
                                                else {
                                                  String MsmValidacion = prospectoForm.MensajeError();
                                                  CustomBgAlertBox(
                                                      context: context,
                                                      title: 'UPS',
                                                      infoMessage: MsmValidacion,
                                                      buttonColor: Colors.red,
                                                      buttonText: 'Cerrar',
                                                      icon: Icons.cancel,
                                                      titleTextColor: Colors.red[400],
                                                  );
                                                }
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
                                                            child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
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
                                
                          const SizedBox(height:7,),
                        ],
                      ),
            ),
               
                      )
                    ),              
                
                ),
          
        ),
      
      );
     */

      return Scaffold(
      backgroundColor: Colors.black,//Color.fromRGBO(3, 9, 23, 1),
      body: SingleChildScrollView(
        child: Center(
          child: ChangeNotifierProvider(
                  create: (_) => LoginFormService(),
                  child: Container(
      decoration: const BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/PassWordCreate.png'), 
                fit: BoxFit.cover,
              ),
            ),  
            width: double.infinity,
      child: Form(
        //key: clienteForm.FormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
          
                                const SizedBox(height: 30,),
          
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                                  shape: CircleBorder(),
                                                  disabledColor: Colors.white,
                                                  elevation: 0,
                                                  color: Colors.transparent,
                                                  child: Container(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                                  onPressed: () => Navigator.pushReplacement(
                                                                      context,
                                                                      CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                                                    ),
                                                  //Navigator.of(context, rootNavigator: true).pop(context),
                                                  
                                              ),
      
                                    Text('Paso 4 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
      
                                    MaterialButton(
                                                      shape: CircleBorder(),
                                                      disabledColor: Colors.white,
                                                      elevation: 0,
                                                      color: Colors.transparent,
                                                      child: Container(child: Icon(Icons.close,color: Colors.white,size: 30,),),
                                                      onPressed: () => //print('Salir')
                                                        exit(0), 
                                                    ),
                                            
                                  ],
                                ),

                                const SizedBox(height: 10,),
          
                                const SizedBox(height: 40,),
                                
                                Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('¿Cuál quieres que sea', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          ],
                        ),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('tu contraseña?', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          ],
                        ),
          
                                    
                      const SizedBox(height: 28,),


                Container(
                            height: 100,
                            color: Colors.transparent,
                            child: Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, ),),
                                                                             
                                  Row(
                                    children: [
                                      Container(
                                          height: 90,
                                          width: SizeScreen.width - 110,//360,
                                          child: TextFormField(
                                            onTap: () {
                                                            setState(() {
                                                              VerValidaciones = true;
                                                            });
                                                          },
                                            style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                          autocorrect: false,
                                                          obscureText: prospectoForm.IsOscured,
                                            maxLength: 20,
                                            keyboardType: prospectoForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                            textInputAction: TextInputAction.done,
                                            decoration: InputDecorations.authInputDecoration(
                                                            TamanioIcono: 20,
                                                            EsContrasenia: true,
                                                            hintText: '',
                                                            labelText: 'Contraseña',
                                                            prefxIcon: Icons.lock_outline,
                                                            colorBordes: Colors.white,
                                                            colorTexto: Colors.white,
                                                            sufixIcon: prospectoForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                              OnPress: () {
                                                                prospectoForm.IsOscured = !prospectoForm.IsOscured;
                                                              },
                                                          ),
                                          //onChanged: (value) => prospectoForm.PassWord = value,
                                          onChanged: ((value) {
                                            prospectoForm.PassWord = value;
                                            onPassWordChanged(value.toString());
                                            
        
                                          }),
                                          /*
                                          validator: (value) {
                                            
                                                            String MensajeValidacion = '';
                                                            if(value != null) {
                                                              if(value.length < 10){
                                                                MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                              }
                                                            }
                                                            return MensajeValidacion;
                                                          },
                                                          */
                                        ),
                                      ),        
                                      
                                    ],
                                  ),
            
                                  const Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                              
                              ],),
            
                            ),
                          ),

                      
                if(VerValidaciones)     
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: Colors.transparent,
                      width: 326,
                      height: 50,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 20,),
                              AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: nivelBajo ? Colors.red : Colors.transparent,
                                        border: nivelBajo ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(40),
                                        
                                      ),
                                    ),
                              Container(
                                color: Colors.transparent,
                                width: 90,
                                height: 10,
                                child: Row (
                                  children: <Widget>[
                                      Expanded(
                                        
                                          child: Container(
                                          decoration: 
                                            nivelIntermedioBajoMedio ?
                  
                                            const BoxDecoration(
                                              gradient:  LinearGradient(
                                              transform: GradientRotation(-227),
                                              colors: <Color>[
                                                          Colors.red,
                                                          Colors.orange
                                                          
                                                        ]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                            
                                            )
                  
                                            :
                  
                                            const BoxDecoration(
                                  gradient: LinearGradient(
                                  transform: GradientRotation(-360),
                                  colors: <Color>[
                                             Colors.white,
                                             Colors.transparent
                                              
                                            ]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                //color: Color(0xFFF4F4F4),
                                
                                ),
                                              child: Container(),
                                            )
                                        ),  
                                    ]
                                  ),
                                ),
                              
                              AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: nivelMedio ? Colors.orange : Colors.transparent,
                                        border: nivelMedio ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(40),
                                        
                                      ),
                                    ),
                              Container(
                                color: Colors.transparent,
                                width: 90,
                                height: 10,
                                child: Row (
                                  children: <Widget>[
                                      Expanded(
                                        
                                          child: Container(
                                          decoration: 
                                            nivelIntermedioMedioAlto ?
                  
                                            const BoxDecoration(
                                              gradient:  LinearGradient(
                                              transform: GradientRotation(-227),
                                              colors: <Color>[
                                                          Colors.orange,
                                                          Colors.green
                                                          
                                                        ]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                            
                                            )
                  
                                            :
                  
                                            const BoxDecoration(
                                  gradient: LinearGradient(
                                  transform: GradientRotation(-360),
                                  colors: <Color>[
                                             Colors.white,
                                              Colors.transparent
                                            ]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                //color: Color(0xFFF4F4F4),
                                
                                ),
                                              child: Container(),
                                            )
                                        ),  
                                    ]
                                  ),
                                ),
                              
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 12,
                                      height: 12,
                                decoration: BoxDecoration(
                                  color: nivelAlto ? Colors.green : Colors.transparent,
                                  border: nivelAlto ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(40),      
                                ),
                              ),
                            ]
                          ),
                  
                          const SizedBox(height: 3,),
                           
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 30,),
                              Text('Baja', style: TextStyle(color: nivelBajo ? Colors.red : Colors.white, fontSize: 12),),
                              Container(
                                color: Colors.transparent,
                                width: 98,
                                child: Row (
                                  children: const <Widget>[
                                     
                                  ]
                                ),
                              ),
                              Text('Media', style: TextStyle(color: nivelMedio ? Colors.orange : Colors.white, fontSize: 12),),
                              Container(
                                color: Colors.transparent,
                                width: 100,
                                child: Row (
                                  children: const <Widget>[
                                     
                                  ]
                                ),
                              ),
                              Text('Alta', style: TextStyle(color: nivelAlto ? Colors.green : Colors.white, fontSize: 12),),
                            ]
                          ),
                        ],
                      )),
                                ),
                  
        
                if(VerValidaciones)     
                  const SizedBox(height: 4,),

                
                if(VerValidaciones)     
                  Column(
                              children: [ 
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('     Tu contraseña debe contener mínimo', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'bolt'),), 
                                  Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                ],
                              ),
                                
                  
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneMayuscula ? Colors.green : Colors.red,
                                      border: tieneMayuscula ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                      
                                    ),
                                    child: Center(child: Icon(tieneMayuscula ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Una mayúscula', style: TextStyle(color: !tieneMayuscula ? Colors.red : Colors.green, fontSize: 14),), 
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneMinuscula ? Colors.green : Colors.red,
                                      border: tieneMinuscula ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                      //tieneMinuscula
                                    ),
                                    child: Center(child: Icon(tieneMinuscula ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Una minúscula', style: TextStyle(color: !tieneMinuscula ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneNumero ? Colors.green : Colors.red,
                                      border: tieneNumero ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneNumero ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  //const SizedBox(width: 10,),
                                  Text('Un número', style: TextStyle(color: !tieneNumero ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneCaracterEspecial ? Colors.green : Colors.red,
                                      border: tieneCaracterEspecial ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneCaracterEspecial ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  Text('Un caracter especial', style: TextStyle(color: !tieneCaracterEspecial ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: tieneDiezCaracteres ? Colors.green : Colors.red,
                                      border: tieneDiezCaracteres ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(child: Icon(tieneDiezCaracteres ? Icons.check : Icons.close, color: Colors.white, size: 12,)),
                                  ),
                                  Text('Mínimo 10 caracteres', style: TextStyle(color: !tieneDiezCaracteres ? Colors.red : Colors.green, fontSize: 14),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                                  const Text('', style: TextStyle(color: Colors.white, fontSize: 30),), 
                                ],
                              ),
                                
                              ],
                            ),
                  
                          
                const SizedBox(height: 50,),
                          
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                    Text('Ingrésala otra vez', style: TextStyle(color: Colors.white, fontSize: 30),),  
                    Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                  ],
                ),

                const SizedBox(height: 20,),

                Container(
                            height: 95,
                            //color: Colors.white,
                            child: Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                                                    //SizedBox(width: 2,), 
                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                              //FrmDatosPersonales(),
                                                                             
                                  Row(
                                                                                //mainAxisAlignment: MainAxisAlignment.end,
                                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                                Container(
                                                        height: 90,
                                                        width: SizeScreen.width - 110,//360,
                                                        child: TextFormField(
                                                          onTap: () {
                                                            setState(() {
                                                              VerValidaciones = false;
                                                            });
                                                          },
                                                          style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                          autocorrect: false,
                                                          obscureText: prospectoForm.IsOscuredConfirm,
                                                            
                                                          keyboardType: prospectoForm.IsOscuredConfirm ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                          textInputAction: TextInputAction.done,
                                                          decoration: InputDecorations.authInputDecoration(
                                                            TamanioIcono: 20,
                                                            EsContrasenia: true,
                                                            hintText: '',
                                                            labelText: 'Confirma Contraseña',
                                                            prefxIcon: Icons.lock_outline,
                                                            colorBordes: Colors.white,
                                                            colorTexto: Colors.white,
                                                            sufixIcon: prospectoForm.IsOscuredConfirm ? Icons.visibility_off : Icons.visibility,
                                                              OnPress: () {
                                                                prospectoForm.IsOscuredConfirm = !prospectoForm.IsOscuredConfirm;
                                                              },
                                                          ),
                                                          onChanged: (value) => prospectoForm.PassWordConfirm = value,
                                                          /*
                                                          validator: (value) {
                                                            
                                                            String MensajeValidacion = '';
                                                            if(value != null) {
                                                              if(value.length < 10){
                                                                MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                              }
                                                            }
            
                                                            return MensajeValidacion;
                                                            
                                                          },
                                                          */
                                                        ),
                                            ),
                                            
                                             ],
                                  ),
            
                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                              
                              ],),
            
                            ),
                          ),
                          

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
                                              onTap: () async {
                                                String Pass = prospectoForm.PassWord;
                                                showDialog(
                                                  context: context, 
                                                  barrierDismissible: false,
                                                  builder: (context) => 
                                                    SimpleDialog(
                                                      alignment: Alignment.center,
                                                      children: [
                                                          SimpleDialogCargando(MensajeMostrar: 'estamos finalizando', MensajeMostrar_2: 'tu proceso de suscripción',),
                                                      ]
                                                    ),
                                                  );
                                                if(prospectoForm.isValidFormPasword() && prospectoForm.isParamsForm()){
                                                    Obj_Prosp!.fechaNacimiento = FechaNacimientoOrigen;
        
                                                  await prospectoForm.registraProspecto(Obj_Prosp!);
        
                                                  if(prospectoForm.ObjRspRegistro!.succeeded) {//&& prospectoForm.ObjTipoRsp!.statusCode == '000'){
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    _scaleController!.forward();
                                                  } else {
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    CustomBgAlertBox(
                                                      context: context,
                                                      title: 'Error al registrar al prospecto',
                                                      infoMessage: prospectoForm.ObjRspRegistro!.message,
                                                      buttonColor: Colors.red,
                                                      buttonText: 'Cerrar',
                                                      icon: Icons.cancel,
                                                      titleTextColor: Colors.red[400],
                                                  );
                                                  }
        
                                                }
                                                else {
                                                  Navigator.of(context, rootNavigator: true).pop();
                                                  CustomBgAlertBox(
                                                      context: context,
                                                      title: '!UPS¡',
                                                      infoMessage: prospectoForm.MensajeError(),
                                                      buttonColor: Colors.red,
                                                      buttonText: 'Cerrar',
                                                      icon: Icons.cancel,
                                                      titleTextColor: Colors.red[400],
                                                  );
                                                }
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

                  /*
                  child: _ClienteForm(
                                _scaleController,
                                _scale2Controller,
                                _widthController,
                                _positionController,
                                _scaleAnimation,
                                _scale2Animation,
                                _widthAnimation,
                                _positionAnimation,
                                MostrarDatosCorreo,
                                Objeto_Prosp_
                      ),
                  */
          
          ),
        ),
      ),
    );
  
  }
}


class PaswordRegEvntLog extends StatelessWidget {

  ProspectoType? Obj_Prosp;
  bool _isObscured = true;
  // simple check
  bool _validPassword = false;

  AnimationController? _scaleController;
  AnimationController? _scale2Controller;
  AnimationController? _widthController;
  AnimationController? _positionController;

  Animation<double>? _scaleAnimation;
  Animation<double>? _scale2Animation;
  Animation<double>? _widthAnimation;
  Animation<double>? _positionAnimation;

  PaswordRegEvntLog(
    AnimationController _scale_Controller, 
    AnimationController _scale2_Controller, 
    AnimationController _width_Controller, 
    AnimationController _position_Controller,
    Animation<double> _scale_Animation,
    Animation<double> _scale2_Animation,
    Animation<double> _width_Animation,
    Animation<double> _position_Animation,
     ProspectoType? VarObj_Prosp
  ){
    _scaleController = _scale_Controller;
    _scale2Controller = _scale2_Controller;
    _widthController = _width_Controller;
    _positionController = _position_Controller;
    _scaleAnimation = _scale_Animation;
    _scale2Animation = _scale2_Animation;
    _widthAnimation = _width_Animation;
    _positionAnimation = _position_Animation;
    Obj_Prosp = VarObj_Prosp;
  }
  
  
  @override
  Widget build(BuildContext context) {
    //final tipoIdentificacion = Provider.of<TipoIdentificacionEvent>(context);
    final prospectoForm = Provider.of<ProspectoTypeService>(context);
    final SizeScreen = MediaQuery.of(context).size;
    String Clave1 = '';
    String Clave2 = '';

    return Container(
          child: Form(
            //key: prospectoForm.FormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                    CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Obj_Prosp: Obj_Prosp)),
                                                  ),
                                //Navigator.of(context, rootNavigator: true).pop(context),                                    
                            ),
          
                            Text('Paso 4 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
                                   
                            MaterialButton(
                                      shape: CircleBorder(),
                                      disabledColor: Colors.white,
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: Container(child: const Icon(Icons.close,color: Colors.white,size: 39,),),
                                      onPressed: () => exit(0),                                   
                            ),                            
                          ],
                        ),
                          
                        const Expanded(
                          child: Center(),
                        ),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('¿Cuál quieres que sea', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          ],
                        ),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('tu contraseña?', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          ],
                        ),
          
                        Container(
                          height: 100,
                          //color: Colors.white,
                          child: Expanded(
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('', style: TextStyle(color: Colors.white, ),),
                                                                           
                                Row(
                                  children: [
                                    Container(
                                        height: 90,
                                        width: SizeScreen.width - 110,//360,
                                        child: TextFormField(
                                                        style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                        autocorrect: false,
                                                        obscureText: prospectoForm.IsOscured,
                                                        maxLength: 20,
                                                        keyboardType: prospectoForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                        textInputAction: TextInputAction.done,
                                                        decoration: InputDecorations.authInputDecoration(
                                                          TamanioIcono: 20,
                                                          EsContrasenia: true,
                                                          hintText: '',
                                                          labelText: 'Contraseña',
                                                          prefxIcon: Icons.lock_outline,
                                                          colorBordes: Colors.white,
                                                          colorTexto: Colors.white,
                                                          sufixIcon: prospectoForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                            OnPress: () {
                                                              prospectoForm.IsOscured = !prospectoForm.IsOscured;
                                                            },
                                                        ),
                                                        onChanged: (value) => prospectoForm.PassWord = value,
                                                        /*
                                                        validator: (value) {
                                                          String MensajeValidacion = '';
                                                          if(value != null) {
                                                            if(value.length < 10){
                                                              MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                            }
                                                          }
                                                          return MensajeValidacion;
                                                        },
                                                        */
                                                      ),
                                    ),        
                                  ],
                                ),
          
                                Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
                            ],),
          
                          ),
                        ),
                        
                        const SizedBox(height: 10,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('Ingrésala otra vez', style: TextStyle(color: Colors.white, fontSize: 30),),  
                            Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          ],
                        ),
                        
                        Container(
                          height: 95,
                          //color: Colors.white,
                          child: Expanded(
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                                                  //SizedBox(width: 2,), 
                                Text('', style: TextStyle(color: Colors.white, ),),
                                                                            //FrmDatosPersonales(),
                                                                           
                                Row(
                                                                              //mainAxisAlignment: MainAxisAlignment.end,
                                                                              //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                              Container(
                                                      height: 90,
                                                      width: SizeScreen.width - 110,//360,
                                                      child: TextFormField(
                                                        style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                        autocorrect: false,
                                                        obscureText: prospectoForm.IsOscuredConfirm,
                                                          
                                                        keyboardType: prospectoForm.IsOscuredConfirm ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                        textInputAction: TextInputAction.done,
                                                        decoration: InputDecorations.authInputDecoration(
                                                          TamanioIcono: 20,
                                                          EsContrasenia: true,
                                                          hintText: '',
                                                          labelText: 'Confirma Contraseña',
                                                          prefxIcon: Icons.lock_outline,
                                                          colorBordes: Colors.white,
                                                          colorTexto: Colors.white,
                                                          sufixIcon: prospectoForm.IsOscuredConfirm ? Icons.visibility_off : Icons.visibility,
                                                            OnPress: () {
                                                              prospectoForm.IsOscuredConfirm = !prospectoForm.IsOscuredConfirm;
                                                            },
                                                        ),
                                                        onChanged: (value) => prospectoForm.PassWordConfirm = value,
                                                        /*
                                                        validator: (value) {
                                                          
                                                          String MensajeValidacion = '';
                                                          if(value != null) {
                                                            if(value.length < 10){
                                                              MensajeValidacion = 'Clave debe ser mínimo a 10 caracteres';
                                                            }
                                                          }
          
                                                          return MensajeValidacion;
                                                          
                                                        },
                                                        */
                                                      ),
                                          ),
                                          
                                           ],
                                ),
          
                                Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
                            ],),
          
                          ),
                        ),
                        
                        const Expanded(
                          child: Center(),
                        ),
          
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
                                            onTap: () async {
                                              String Pass = prospectoForm.PassWord;
                                              print('Clave muestra: $Pass');
                                              if(prospectoForm.isValidFormPasword() && prospectoForm.isParamsForm()){
                                                  Obj_Prosp!.fechaNacimiento = FechaNacimientoOrigen;
                                                await prospectoForm.registraProspecto(Obj_Prosp!);
                                                Future.delayed(const Duration(milliseconds: 3500), (){
                                                  if(prospectoForm.ObjTipoRsp!.succeeded) {//&& prospectoForm.ObjTipoRsp!.statusCode == '000'){
                                                    _scaleController!.forward();
                                                  }});
                                              }
                                              else {
                                                String MsmValidacion = prospectoForm.MensajeError();
                                                CustomBgAlertBox(
                                                    context: context,
                                                    title: 'Error',
                                                    infoMessage: MsmValidacion,
                                                    buttonColor: Colors.red,
                                                    buttonText: 'Cerrar',
                                                    //icon: Icons.close_rounded,
                                                    icon: Icons.cancel,
                                                    titleTextColor: Colors.red[400],
                                                );
                                              }
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
                                                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
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
                              
                        const SizedBox(height:7,),
                      ],
                    ),
          ),
       
      // ),

      //),
    );
  }
  

}

/*
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customized Field"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _validPassword
                ? Text(
                    "Password Valid!",
                    style: TextStyle(fontSize: 22.0),
                  )
                : Container(),
            PasswordValidatedFields(
              inActiveIcon: Icons.cancel,
              activeIcon: Icons.done_all,
              inputDecoration: InputDecoration(
                labelText: "Enter password",
                filled: true,
                fillColor: Colors.grey[300],
                prefixIcon: Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ), // password validated filed from package
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _validPassword = true;
                    });
                  } else {
                    setState(() {
                      _validPassword = false;
                    });
                  }
                },
                child: Text("Check password!")),
          ],
        ),
      ),
    );
*/
