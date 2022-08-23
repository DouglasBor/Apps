
import 'dart:io';
import 'package:enroll_app/Animations/FadeAnimation.dart';
import 'package:enroll_app/bloc/index.dart';
import 'package:enroll_app/eventos_widgets/index.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
/*

class VerificationOtpScreen extends StatefulWidget {

  ProspectoType? Obj_Prosp;
  ProspectoType? ObjPrspValido;

  VerificationOtpScreen({required Obj_Prosp}){
    var Nombre = Obj_Prosp!.nombres;
    ObjPrspValido = Obj_Prosp;
    print('Obj Prosp2-- $Nombre');
  }
  

  static const String routerName = 'verificacionOtpScreen';
  @override
  _ContenidoScreen createState() => _ContenidoScreen(ObjProspecto:ObjPrspValido);

}

class _ContenidoScreen extends State<VerificationOtpScreen> with TickerProviderStateMixin{
  ProspectoType? ObjProspecto;
  ProspectoType? Objeto_Prosp_;
  String Var_Coordenadas = '';
  ProspectoType? ObjetoProspecto;
  _ContenidoScreen({required ObjProspecto}){
    print('Entro a coordenadas: $CoordenadasRes');
    var Nombre = ObjProspecto!.nombres;
    Objeto_Prosp_ = ObjProspecto;
    ObjetoProspecto = ObjProspecto;
    //ObjPrspValido = Obj_Prosp;
    print('Obj Prosp3-- $Nombre');
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
      backgroundColor: Colors.black,//Color.fromRGBO(3, 9, 23, 1),
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
          
                                const SizedBox(height: 20,),
          
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
                                                                      CupertinoPageRoute(builder: (context) => OtpScreen(ObjetoProspecto)),
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

                                Center(
                                  child: Text(
                                    'Código de verificación',
                                    style: TextStyle(color: Colors.orange[700], fontSize: 32),),
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
          
                      const SizedBox(height: 30,),
          
                      const Center(
                        child: Text('Para continuar con la verificación',style: TextStyle(color: Colors.white, fontSize: 17),),                
                      ),

                      const Center(
                        child: Text('Ingresa el código enviado por SMS o Email',style: TextStyle(color: Colors.white, fontSize: 17),),                
                      ),
                      
                      const SizedBox(height: 45,),

                      Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                  ChangeNotifierProvider(
                                                                    create: (_) => OtpService(),
                                                                    child: OtpForm(ObjetoProspecto),
                                                                                      
                                                                  ),
                                                                  const Text('',style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            
                                                                      ],),

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
*/