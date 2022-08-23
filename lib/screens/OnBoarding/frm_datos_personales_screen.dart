
/*
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

bool CoordenadasRes = false;

class FrmDatosPersonalesScreen extends StatefulWidget {

  String Coordenadas = '';

   FrmDatosPersonalesScreen({Coordenadas,required Obj_Prosp}){
    
  String Coordenadas = '';
  ProspectoType? Obj_Prosp;
  ProspectoType? ObjPrspValido;
    if(Coordenadas != null){
      CoordenadasRes = true;
    }
    else{
      CoordenadasRes = false;
    }
  }
  

  static const String routerName = 'datospersonalesonbrd';
  @override
  _FrmDatosPersonalesScreen createState() => _FrmDatosPersonalesScreen(Var_Coordenadas: Coordenadas);

}

class _FrmDatosPersonalesScreen extends State<FrmDatosPersonalesScreen> with TickerProviderStateMixin{

  String Var_Coordenadas = '';
  bool MostrarDatosCorreo = false;
  _FrmDatosPersonalesScreen({required Var_Coordenadas}){
    print('Entro a coordenadas: $CoordenadasRes');
    if(CoordenadasRes.toString() != null){
      MostrarDatosCorreo = true;
    }
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
        //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: PassWordScreen()));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
   
    return Scaffold(
      backgroundColor: Colors.black,//Color.fromRGBO(3, 9, 23, 1),
      //body: SingleChildScrollView(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          print('VuelvePantallaForm: $state');
          return 
          
          state.isAllGranted
          ?
         _FrmCliente(scaleController: _scaleController, scale2Controller: _scale2Controller, widthController: _widthController, positionController: _positionController, scaleAnimation: _scaleAnimation, scale2Animation: _scale2Animation, widthAnimation: _widthAnimation, positionAnimation: _positionAnimation, MostrarDatosCorreo: MostrarDatosCorreo)
          :
          MapScreen();
        }
      ),
    );
  }
}

class _FrmCliente extends StatelessWidget {
  const _FrmCliente({
    Key? key,
    required AnimationController? scaleController,
    required AnimationController? scale2Controller,
    required AnimationController? widthController,
    required AnimationController? positionController,
    required Animation<double>? scaleAnimation,
    required Animation<double>? scale2Animation,
    required Animation<double>? widthAnimation,
    required Animation<double>? positionAnimation,
    required this.MostrarDatosCorreo,
  }) : _scaleController = scaleController, _scale2Controller = scale2Controller, _widthController = widthController, _positionController = positionController, _scaleAnimation = scaleAnimation, _scale2Animation = scale2Animation, _widthAnimation = widthAnimation, _positionAnimation = positionAnimation, super(key: key);

  final AnimationController? _scaleController;
  final AnimationController? _scale2Controller;
  final AnimationController? _widthController;
  final AnimationController? _positionController;
  final Animation<double>? _scaleAnimation;
  final Animation<double>? _scale2Animation;
  final Animation<double>? _widthAnimation;
  final Animation<double>? _positionAnimation;
  final bool MostrarDatosCorreo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
              create: (_) => ClienteFormService(),
              child: _ClienteForm(
                            _scaleController,
                            _scale2Controller,
                            _widthController,
                            _positionController,

                            _scaleAnimation,
                            _scale2Animation,
                            _widthAnimation,
                            _positionAnimation,
                            MostrarDatosCorreo
                          ),
      ),
      
    );
  }
}

class FrmDatosPersonales extends StatelessWidget {
  bool Es_Pasaporte = false;
  VoidCallback? OnPress;

  FrmDatosPersonales({required OnPress,required Es_Pasaporte});


  @override
  Widget build(BuildContext context) {
    //final tipoIdentificacion = Provider.of<TipoIdentificacionEvent>(context);
  
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              
              CustomInputField(
                esCalendario: true,
                TamanioIcono: 35,
                OnPress: OnPress
              ),
          ]),
        ),
        
      
    );

  }
}

class _ClienteForm extends StatelessWidget {
  bool _isObscured = true;


  TextEditingController _Controller = TextEditingController();
  AnimationController? _scaleController;
  AnimationController? _scale2Controller;
  AnimationController? _widthController;
  AnimationController? _positionController;

  Animation<double>? _scaleAnimation;
  Animation<double>? _scale2Animation;
  Animation<double>? _widthAnimation;
  Animation<double>? _positionAnimation;
  bool MostrarDatosCorreo = false;

  _ClienteForm(
    AnimationController? _scale_Controller,
    AnimationController? _scale2_Controller,
    AnimationController? _width_Controller,
    AnimationController? _position_Controller,

    Animation<double>? _scale_Animation,
    Animation<double>? _scale2_Animation,
    Animation<double>? _width_Animation,
    Animation<double>? _position_Animation,
    bool Mostrar_DatosCorreo)
  {
    _scaleController = _scale_Controller;
    _scale2Controller = _scale2_Controller;
    _widthController = _width_Controller;
    _positionController = _position_Controller;

    _scaleAnimation = _scale_Animation;
    _scale2Animation = _scale2_Animation;
    _widthAnimation = _width_Animation;
    _positionAnimation = _position_Animation;
    MostrarDatosCorreo = Mostrar_DatosCorreo;
  }

  @override
  Widget build(BuildContext context) {
    final clienteForm = Provider.of<ClienteFormService>(context); 
    Icon IconoSeleccionado;
    print('Tiene coordenadas: $MostrarDatosCorreo');
    clienteForm.tieneUbicacion = CoordenadasRes;

    if(clienteForm.tieneUbicacion){
     IconoSeleccionado = Icon(Icons.check, color: Colors.green, size: 37,);
    }
    else{
      IconoSeleccionado = Icon(Icons.warning_rounded, color: Colors.yellow, size: 37,);
    }
    
    return Container(
      decoration: const BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/FrmDatosPersonales.png'), 
                fit: BoxFit.cover,
              ),
            ),  
            width: double.infinity,
      child: Form(
        key: clienteForm.FormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                      CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                                                    ),
                                                  //Navigator.of(context, rootNavigator: true).pop(context),
                                                  
                                              ),
      
                                          //SizedBox(height: 50,),
      
                                          Text('Paso 3 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
      
                                          //SizedBox(height: 50,),
      
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

                                SizedBox(height: 10,),
          
          
                                SizedBox(height: 40,),
                                
                                Center(
                                        child: Text('Sabemos que trabajas en',style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'champagne_limous'),),
                                          
                                      ),
                              
                                SizedBox(height: 5,),
                         
                               Center(
                                        child: Text('Grupo Riasem',style: TextStyle(color: Colors.orange[700], fontSize: 20),),
                                          
                                      ),
          
                                    
                               SizedBox(height: 7,),
          
                               Center(
                                  child: Text('y que tu número celular es',style: TextStyle(color: Colors.white, fontSize: 20),),                              
                                ),
                                SizedBox(height: 5,),
                                
                                Center(
                                    child: Text('0988665834',style: TextStyle(color: Colors.white, fontSize: 20),),
                                          
                                ),
                                    
                                SizedBox(height: 28,),
          
                      Center(
                                        child: Text('Cuéntanos un poco más de ti...',style: TextStyle(color: Colors.orange[700], fontSize: 20),),
                                          
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
                                            height: 123,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  SizedBox(width: 2,), 
                                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                  Text('Nací el ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                           
                                                                  Row(
                                                                              //mainAxisAlignment: MainAxisAlignment.end,
                                                                              //crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  
                                                                                  //color: Colors.white,
                                                                                    height: 110,
                                                                                    //width: 400,//360,
                                                                                    width: MediaQuery.of(context).size.width - 141,
                                                                                    //child: FrmDatosPersonales(OnPress: callDatePicker, Es_Pasaporte: false,),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                                                                      child: TextFormField(
                                                                                        controller: _Controller,
                                                                                        autocorrect: false,
                                                                                        enableSuggestions: true,
                                                                                        readOnly: true,
                                                                                                autofocus: false,
                                                                                                style: const TextStyle(color: Colors.white),
                                                                                                //textCapitalization: TextCapitalization.words,
                                                                                                /*
                                                                                                onTap: ()async {
                                                                                                   DateTime? SelectedDate = await showDatePicker(
                                                                                                      context: context, 
                                                                                                      initialDate: DateTime.now(),
                                                                                                      firstDate: DateTime(2000), 
                                                                                                      lastDate: DateTime(2050),
                                                                                                      /*
                                                                                                      builder: (context,child) {
                                                                                                        return Theme(data: ThemeData.dark(), child: child);
                                                                                                      },*/
                                                                                                      
                                                                                                    );
      
                                                                                                    FechaNacimiento = DateFormat('dd-MM-yyyy').format(SelectedDate!);
                                                                                                    print('Fecha nacimiento $FechaNacimiento');
                                                                                                },
                                                                                                */
                                                                                                
                                                                                                validator: (value){
                                                                                                    //value = FechaNacimiento;
                                                                                                },
                                                                                                decoration: InputDecorations.authInputDecoration(
                                                                                                  EsContrasenia: false,
                                                                                                  colorBordes: Colors.white,
                                                                                                  TamanioIcono: 35,
                                                                                                          hintText: '',
                                                                                                          labelText: '',
                                                                                                          sufixIcon: Icons.calendar_month_outlined,
                                                                                                          OnPress: ()async{
                                                                                                            DateTime FechaActual = DateTime.now();
                                                                                                            int AnioActual = FechaActual.year;
                                                                                                            int AnioValido = AnioActual - 18;
                                                                                                            DateTime? SelectedDate = await showDatePicker(
                                                                                                              cancelText: 'Cancelar',
                                                                                                              confirmText: 'Ok',
                                                                                                              fieldLabelText: 'Mes/Día/Año',
                                                                                                              helpText: '',
                                                                                                              initialEntryMode: DatePickerEntryMode.calendarOnly,
                                                                                                              //locale: const Locale('ec'),
                                                                                                              //keyboardType: TextInputType.datetime,
      
                                                                                                              errorFormatText: 'Formato inválido',
                                                                                                              context: context, 
                                                                                                              initialDate: DateTime(1980),
                                                                                                              firstDate: DateTime(1980), 
                                                                                                              lastDate: DateTime(AnioValido + 1),
                                                                                                              
                                                                                                              builder: (context,child) {
                                                                                                                return Theme(
                                                                                                                  
                                                                                                                  child: child!,
                                                                                                                  data: Theme.of(context).copyWith(
                                                                                                                    colorScheme: ColorScheme.light(
                                                                                                                      primary: Colors.orange,
                                                                                                                      onPrimary: Colors.black
                                                                                                                    ),
                                                                                                                    textButtonTheme: TextButtonThemeData(
                                                                                                                      style: TextButton.styleFrom(primary: Colors.black)
                                                                                                                    )
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                              
                                                                                                            );
                                                                                                            if(SelectedDate != null){
                                                                                                              _Controller.text = DateFormat('dd-MM-yyyy').format(SelectedDate);
                                                                                                            }
                                                                                                            else {
                                                                                                              _Controller.text = '';
                                                                                                            }
                                                                                                            clienteForm.FechaNacimiento = _Controller.text;
                                                                                                            
                                                                                                          }
                                                                                                        ),
                                                                                                        /*
                                                                                                decoration: const InputDecoration(
                                                                                                  hintText: '',
                                                                                                  labelText: '',
                                                                                                  suffixIcon: Icon(Icons.calendar_month_outlined,),
                                                                                                  //icon: Icon(Icons.assignment_ind_outlined),
                                                                                                ),
                                                                                                */
                                                                                              ),
                                                                                    ),
                                                                                ),
                                                                              ],
                                                                  ),
      
                                                                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                            height: 84,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                            Text('Mi género es ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                            
                                                                            Container(
                                                                              //color: Colors.white,
                                                                                                height: 100,
                                                                                                width: MediaQuery.of(context).size.width - 220,
                                                                                                //width: 310,//360,
                                                                                                child: Center(
                                                                                                  child: DropdownButtonFormField<String>(// Fernando Herrera video 93 el que tengo el 50% del curso
                                                                                                    
                                                                                                    decoration: const InputDecoration(
                                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Colors.white,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Colors.white,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  labelStyle: TextStyle(color: Colors.grey),
                                                                                                                  
                                                                                              ),
                                                                                              value: 'S',
                                                                                              dropdownColor: Colors.indigo[300],
                                                                                              //focusColor: Colors.orange,
                                                                                              style: TextStyle(color: Colors.white),
                                                                                              //isExpanded: true,
                                                                                              items: const [
                                                                                                  DropdownMenuItem(value: 'S', child: Text('-- Seleccione --')),
                                                                                                  DropdownMenuItem(value: 'M', child: Text('Masculino')),
                                                                                                  DropdownMenuItem(value: 'F', child: Text('Femenino')),
                                                                                              ],
                                                                                              onChanged: (value){
                                                                                                  print(value);
                                                                                                  clienteForm.Genero = value.toString();
                                                                                              },
                                                                                            ),
                                                                                                ),
                                                                                 
                                                                                      ),
      
                                                                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        height: 110,
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                  Text('Y vivo en ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                            
                                                                  Container(
                                                                              //color: Colors.white,
                                                                      height: 140,
                                                                      width: MediaQuery.of(context).size.width - 184,
                                                                                                //width: 350,//360,
      
                                                                                                child: Center(
                                                                                                  child: TextFormField(
                                                                                                    onChanged: (value) => clienteForm.Direccion = value,
                                                                                                style: const TextStyle(color: Colors.white),
                                                                                                        autofocus: false,                                                                                                        
                                                                                                        maxLines: 3,
                                                                                                        
                                                                                                        //textCapitalization: TextCapitalization.words,
                                                                                                        
                                                                                                        validator: (value){
          
                                                                                                        },
                                                                                                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                                        decoration: InputDecorations.authInputDecoration(
                                                                                                          EsContrasenia: false,
                                                                                                          colorBordes: Colors.white,
                                                                                                          colorTexto: Colors.white,
                                                                                                          TamanioIcono: 35,
                                                                                                                  hintText: '',
                                                                                                                  labelText: '',
                                                                                                                  //sufixIcon: Icons.calendar_month_outlined,
                                                                                                                  OnPress: (){}
                                                                                                                ),
                                                                                                      ),
                                                                                   
                                                                                                ),
                                                                                 
                                                                                      ),
      
                                                                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        ),
                                      )),
                                    )),
      
      //Ubicación de mapa
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
                                            height: 100,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                    Text('', style: TextStyle(color: Colors.white, ),),
                                                                    
                                                                    Text('En esta ubicación ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                    Container(
                                                                                width: 80,
                                                                                height: 400,
                                                                                child: 
                                                                        
                                                                                
                                                                                GestureDetector(
                                                                                  /*
                                                                                        onTap: (){
                                                                                          /*
                                                                                          Navigator.push(
                                                                                            context,
                                                                                            CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()),
                                                                                          );
                                                                                          */
                                                                                          Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()));
                                                                                        },
                                                                                        */
            
                                                                                        /*
                                                                                        child: Container(
                                                                                          width: 60,
                                                                                          height: 60,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                            color: Colors.green[600]
                                                                                          ),
                                                                                          child: const Center(child:  Image(image: AssetImage('assets/IcMapaPaso3.png'), fit: BoxFit.cover, height: 40,)),
                                                                                        )
                                                                                        */
            
                                                                                        child: FadeAnimation(1.6, AnimatedBuilder(
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
                                                                                                  color: Colors.grey.withOpacity(.4)
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    //Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()));
                                                                                                    //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: const LoadingScreen()));
                                                                                                    //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: const AccessGpsScreen()));

                                                                                                    final gpsBloc = BlocProvider.of<GpsBloc>(context);
                                                                                                    gpsBloc.askGpsAccess();


                                                                                                    /*
                                                                                                    print('Entra');
                                                                                                    final gpsBloc = BlocProvider.of<GpsBloc>(context);
                                                                                                    gpsBloc.askGpsAccess();
                                                                                                    */
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
                                                                                                                  color: Colors.grey.withOpacity(.4)
                                                                                                                ),
                                                                                                                child: FadeAnimation(1.6, AnimatedBuilder(
                                                                                          animation: _scaleController!,
                                                                                          builder: (context, child) => Transform.scale(
                                                                                          scale: _scaleAnimation!.value,
                                                                                          child: Center(
                                                                                            child: AnimatedBuilder(
                                                                                              animation: _widthController!,
                                                                                              builder: (context, child) => Container(
                                                                                                width: _widthAnimation!.value,
                                                                                                height: 60,
                                                                                                padding: EdgeInsets.all(10),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(50),
                                                                                                  color: Colors.grey.withOpacity(.4)
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  
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
                                                                                                                width: 40,
                                                                                                                height: 38,
                                                                                                                child: Container(child: Image(image: AssetImage('assets/IcMapaPaso3.png'), fit: BoxFit.cover, height: 50,))
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
                                                                                    
                                                                                        
                                                                                      )
                                                                                
                                                                                
                                                                              ),

                                                                      IconoSeleccionado,
                                                                            
                                                                      
                                                                          Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        ),
                                      )),
                                    )),
                                   
                      if(clienteForm.tieneUbicacion)
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
                                            height: 40,
                                            padding: const EdgeInsets.all(10),
                                            child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Container(
                                                                //color: Colors.white,
                                                                child: Row(
                                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: const [
                                                                      SizedBox(width: 20,),
                                                                      Text('Mi correo electrónico es ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                      Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                  ],),
                                                              ),
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
      
                      if(clienteForm.tieneUbicacion)
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
                                            width: MediaQuery.of(context).size.width - 70,
                                            height: 80,
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                                      child: TextFormField(
                                                                onChanged: (value) => clienteForm.Correo = value,
                                                                autocorrect: false,
                                                                                            keyboardType: TextInputType.emailAddress,//tipo de imput -> correo
                                                                                            style: const TextStyle(color: Colors.white),
                                                                                            decoration: InputDecorations.authInputDecoration(
                                                                                              TamanioIcono: 20,
                                                                                              colorBordes: Colors.white,
                                                                                              EsContrasenia: false,
                                                                                              hintText: 'avaldiviezo@riasem.com.ec',
                                                                                              labelText: '',
                                                                                              OnPress: (){}
                                                                                            ),
                                                                                            //onChanged: (value) => loginForm.Email = value,
                                                                                            validator: (value) {
                                                                                              
                                                                                              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                                                              RegExp regExp  = new RegExp(pattern);
                                                                                              return regExp.hasMatch(value ?? '') ? null : 'Correo invalido';
                                                                                              
                                                                                            },
                                                                                          ),
                                                                                        ),
                
                                          ),
                                        ),
                                      )),
                                    )),
      
                      if(clienteForm.tieneUbicacion)
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
                                                if(clienteForm.ValidaFormulario(clienteForm.FechaNacimiento, clienteForm.Genero, clienteForm.Direccion, clienteForm.Correo)) {
                                                  _scaleController!.forward();
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
    );

    
    }
  }
  */

 

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

import 'package:intl/date_symbol_data_local.dart'; // for other locales

bool CoordenadasRes = false;

class FrmDatosPersonalesScreen extends StatefulWidget {

  String Coordenadas = '';
  ProspectoType? Obj_Prosp;
  ProspectoType? ObjPrspValido;

  FrmDatosPersonalesScreen({Coordenadas,required Obj_Prosp}){
    print('Coordenadas enviadas: $Coordenadas');
    var Nombre = Obj_Prosp!.nombres;
    ObjPrspValido = Obj_Prosp;
    print('Obj Prosp2-- $Nombre');
    if(Coordenadas != null){
      CoordenadasRes = true;
    }
    else{
      CoordenadasRes = false;
    }
  }
  

  static const String routerName = 'datospersonalesonbrd';
  @override
  _FrmDatosPersonalesScreen createState() => _FrmDatosPersonalesScreen(Var_Coordenadas: Coordenadas,ObjProspecto:ObjPrspValido);

}

class _FrmDatosPersonalesScreen extends State<FrmDatosPersonalesScreen> with TickerProviderStateMixin{
  ProspectoType? ObjProspecto;
  ProspectoType? Objeto_Prosp_;
  String Var_Coordenadas = '';
  bool MostrarDatosCorreo = false;
  ProspectoType? ObjetoProspecto;
  _FrmDatosPersonalesScreen({required Var_Coordenadas, required ObjProspecto}){
    print('Entro a coordenadas: $CoordenadasRes');
    var Nombre = ObjProspecto!.nombres;
    Objeto_Prosp_ = ObjProspecto;
    ObjetoProspecto = ObjProspecto;
    //ObjPrspValido = Obj_Prosp;
    print('Obj Prosp3-- $Nombre');
    if(CoordenadasRes.toString() != null){
      MostrarDatosCorreo = true;
    }
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
    print('Tiene coordenadas: $MostrarDatosCorreo');
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
      backgroundColor: Colors.transparent,//Color.fromRGBO(3, 9, 23, 1),
      body: SingleChildScrollView(
        child: Center(
          child: ChangeNotifierProvider(
            create: (_) => ClienteFormService(),
            child: Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/FrmDatosPersonales.png'), 
              fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Form(
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
                                                  shape: const CircleBorder(),
                                                  disabledColor: Colors.white,
                                                  elevation: 0,
                                                  color: Colors.transparent,
                                                  child: Container(color: Colors.transparent, child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                                  onPressed: () => Navigator.pushReplacement(
                                                                      context,
                                                                      CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                                                    ),
                                                  //Navigator.of(context, rootNavigator: true).pop(context),
                                                  
                                              ),
      
                                    Text('Paso 3 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
      
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
                                
                                const Center(
                                  child: Text('Sabemos que trabajas en',style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'champagne_limous'),),
                                ),
                              
                                const SizedBox(height: 5,),
                         
                               Center(
                                  child: Text(ObjetoProspecto!.grupoEmpresarial,style: TextStyle(color: Colors.orange[700], fontSize: 24),),
                                ),
          
                                    
                               const SizedBox(height: 7,),
          
                               const Center(
                                child: Text('y que tu número celular es',style: TextStyle(color: Colors.white, fontSize: 24),),                              
                               ),

                                const SizedBox(height: 5,),
                                
                                Center(
                                    child: Text(ObjetoProspecto!.celular,style: const TextStyle(color: Colors.white, fontSize: 24),),
                                          
                                ),
                                    
                      const SizedBox(height: 28,),
          
                      Center(
                        child: Text('Cuéntanos un poco más de ti...',style: TextStyle(color: Colors.orange[700], fontSize: 24),),                
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
                                            height: 120,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  const SizedBox(width: 2,), 
                                                                  const Text('', style: TextStyle(color: Colors.white, ),),
                                                                  const Text('Nací el ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        color: Colors.transparent,
                                                                        height: 110,
                                                                        width: MediaQuery.of(context).size.width - 141,
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                                                          child: TextButton(
                                                                            style: ButtonStyle(
                                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  side: const BorderSide(color: Colors.white)
                                                                                )
                                                                              )
                                                                            ),
                                                                            onPressed: () async {
                                                                              initializeDateFormatting('es'); 
/*

  initializeDateFormatting('es'); 
    final Fecha_Ingreso = DateTime.parse(Obj_UserGeneralRol!.fechaIngreso);
    final FechaIngreso = DateFormat.yMMMMd('es').format(Fecha_Ingreso);

*/

                                                                              DateTime FechaActual = DateTime.now();
                                                                              int AnioActual = FechaActual.year;
                                                                              int AnioValido = AnioActual - 18;
                                                                              DateTime? SelectedDate = await showDatePicker(
                                                                                
                                                                                  cancelText: 'Cancelar',
                                                                                  confirmText: 'Ok',
                                                                                  fieldLabelText: 'Mes/Día/Año',
                                                                                  helpText: '',
                                                                                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                                                                                  errorFormatText: 'Formato inválido',
                                                                                  context: context, 
                                                                                  initialDate: DateTime(1920),
                                                                                  firstDate: DateTime(1920), 
                                                                                  lastDate: DateTime(AnioValido + 1),
                                                                                  builder: (context,child) {
                                                                                    return Theme(
                                                                                      child: child!,
                                                                                      data: Theme.of(context).copyWith(
                                                                                      colorScheme: const ColorScheme.light(
                                                                                        primary: Colors.orange,
                                                                                        onPrimary: Colors.black
                                                                                      ),
                                                                                      textButtonTheme: TextButtonThemeData(
                                                                                        style: TextButton.styleFrom(primary: Colors.black)
                                                                                      )
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                                              
                                                                                                            );
                                                                              if(SelectedDate != null){
                                                                                ObjetoProspecto!.FechaNacDate = SelectedDate;
                                                                                setState(() {
                                                                                  ObjetoProspecto!.fechaNacimiento = DateFormat('dd-MM-yyyy').format(SelectedDate);
                                                                                });
                                                                              }
                                                                              else {
                                                                                //_Controller.text = ObjetoProspecto!.fechaNacimiento;
                                                                              }  
                                                                            },
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                const Text('',style: TextStyle(color: Colors.white),),
                                                                                Text(ObjetoProspecto!.fechaNacimiento,style: const TextStyle(color: Colors.white, fontSize: 15),),
                                                                                const Icon(Icons.calendar_month_outlined,color: Colors.white,size: 30,),
                                                                                ],
                                                                              ),
                                                                          ),
 
                                                                      ),
                                                                        
                                                                    ),
                                                                  ],
                                                                  
                                                                ),
      
                                                                const Text(' ', style: TextStyle(color: Colors.white, fontSize: 1),),  
                                                                            
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
                                            height: 84,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                            Text('Mi género es ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                            
                                                                            Container(
                                                                              color: Colors.transparent,
                                                                                height: 100,
                                                                                width: MediaQuery.of(context).size.width - 220,
                                                                                child: Container(
                                                                                  color: Colors.white,
                                                                                  child: Center(
                                                                                    child: DropdownButtonFormField<String>(// Fernando Herrera video 93 el que tengo el 50% del curso
                                                                                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                                                                                    decoration: const InputDecoration(
                                                                                      
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                                //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                                                borderSide: BorderSide(
                                                                                                                    color: Colors.white,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.white,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    labelStyle: TextStyle(color: Colors.grey),
                                                                                                                    
                                                                                                ),
                                                                                    value: ObjetoProspecto!.genero == '' ? 'S' : ObjetoProspecto!.genero,
                                                                                    dropdownColor: Colors.white,
                                                                                    style: const TextStyle(color: Colors.white),
                                                                                    items: const [
                                                                                      DropdownMenuItem(value: 'S', child: Text('-- Seleccione --',style: TextStyle(color: Colors.black87))),
                                                                                      DropdownMenuItem(value: 'M', child: Text('Masculino',style: TextStyle(color: Colors.black87),)),
                                                                                      DropdownMenuItem(value: 'F', child: Text('Femenino',style: TextStyle(color: Colors.black87))),
                                                                                    ],
                                                                                    onChanged: (value) 
                                                                                    {
                                                                                      ObjetoProspecto!.genero = value.toString();
                                                                                    },
                                                                                  ),
                                                                              ),
                                                                                ),
                                                                                 
                                                                            ),
      
                                                                              const    Text(' ', style: TextStyle(color: Colors.white, fontSize: 1),),  
                                                                            
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
                                        height: 110,
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                  Text('Y vivo en ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                            
                                                                  Container(
                                                                      
                                                                      height: 140,
                                                                      width: MediaQuery.of(context).size.width - 184,
                                                                                                //width: 350,//360,
      
                                                                                                child: Center(
                                                                                                  child: TextFormField(
                                                                                                    initialValue: ObjetoProspecto!.direccion,
                                                                                                    onChanged: (value) //=> clienteForm.Direccion = value,
                                                                                                    {
                                                                                                      clienteForm.Direccion = value;
                                                                                                      //Cliente.Direccion = value;
                                                                                                      ObjetoProspecto!.direccion = value;
                                                                                                    },
                                                                                                style: const TextStyle(color: Colors.white),
                                                                                                                                                                                                            
                                                                                                        maxLines: 3,
                                                                                                        
                                                                                                        //textCapitalization: TextCapitalization.words,
                                                                                                        
                                                                                                        validator: (value){
                                                                                                          ObjetoProspecto!.direccion = value;
                                                                                                        },
                                                                                                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                                        decoration: InputDecorations.authInputDecoration(
                                                                                                          EsContrasenia: false,
                                                                                                          colorBordes: Colors.white,
                                                                                                          colorTexto: Colors.white,
                                                                                                          TamanioIcono: 35,
                                                                                                                  hintText: '',
                                                                                                                  labelText: '',
                                                                                                                  //sufixIcon: Icons.calendar_month_outlined,
                                                                                                                  OnPress: (){}
                                                                                                                ),
                                                                                                      ),
                                                                                   
                                                                                                ),
                                                                                 
                                                                                      ),
      
                                                                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        ),
                                      )),
                                    )),
      
      //UBicación

                      Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                    const Text('', style: TextStyle(color: Colors.white, ),),
                                                                    
                                                                    const Text('En esta ubicación ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                    Container(
                                                                      width: 80,
                                                                      height: 100,
                                                                      child:
                                                                        GestureDetector(
            
                                                                                        child: FadeAnimation(1.6, AnimatedBuilder(
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
                                                                                                  color: ColorBotonOpacidad
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    //Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()));
                                                                                                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: LoadingScreen(Obj_Prospect: ObjetoProspecto,)));
                                                                                                    //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: const AccessGpsScreen()));
                                                                                                    /*
                                                                                                    print('Entra');
                                                                                                    final gpsBloc = BlocProvider.of<GpsBloc>(context);
                                                                                                    gpsBloc.askGpsAccess();
                                                                                                    */
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
                                                                                                                  color: ColorBotonOpacidad
                                                                                                                ),
                                                                                                                child: FadeAnimation(1.6, AnimatedBuilder(
                                                                                          animation: _scaleController!,
                                                                                          builder: (context, child) => Transform.scale(
                                                                                          scale: _scaleAnimation!.value,
                                                                                          child: Center(
                                                                                            child: AnimatedBuilder(
                                                                                              animation: _widthController!,
                                                                                              builder: (context, child) => Container(
                                                                                                width: _widthAnimation!.value,
                                                                                                height: 60,
                                                                                                padding: EdgeInsets.all(10),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(50),
                                                                                                  color: ColorBotonOpacidad
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  
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
                                                                                                                width: 40,
                                                                                                                height: 38,
                                                                                                                child: Container(child: Image(image: AssetImage('assets/IcMapaPaso3.png'), fit: BoxFit.cover, height: 50,))
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
                                                                                    
                                                                                        
                                                                                      )
                                                                                
                                                                                
                                                                              ),

                                                                      IconoSeleccionado,
                                                                            
                                                                      
                                                                          Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
                                                                      ],),
                                      

                      if(clienteForm.tieneUbicacion)
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
                                            height: 40,
                                            padding: const EdgeInsets.all(10),
                                            child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Container(
                                                                //color: Colors.white,
                                                                child: Row(
                                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: const [
                                                                      SizedBox(width: 20,),
                                                                      Text('Mi correo electrónico es ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                      Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                  ],),
                                                              ),
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
      
                      if(clienteForm.tieneUbicacion)
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
                                            width: MediaQuery.of(context).size.width - 70,
                                            height: 80,
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                                      child: TextFormField(
                                                        initialValue: ObjetoProspecto!.email,
                                                        onChanged: (value) //=> clienteForm.Correo = value,
                                                        {
                                                          clienteForm.Correo = value;
                                                          //Cliente.Correo = value;
                                                          ObjetoProspecto!.email = value;
                                                                  //setState(() {});
                                                        },
                                                        autocorrect: false,
                                                        keyboardType: TextInputType.emailAddress,//tipo de imput -> correo
                                                        style: const TextStyle(color: Colors.white),
                                                        decoration: InputDecorations.authInputDecoration(
                                                          TamanioIcono: 20,
                                                          colorBordes: Colors.white,
                                                          EsContrasenia: false,
                                                          hintText: 'avaldiviezo@riasem.com.ec',
                                                          labelText: '',
                                                          OnPress: (){}
                                                        ),
                                                        validator: (value) {
                                                          String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                          RegExp regExp  = RegExp(pattern);
                                                          return regExp.hasMatch(value ?? '') ? null : 'Correo invalido';
                                                                                              
                                                        },
                                              ),
                                            ),
                
                                          ),
                                        ),
                                      )),
                                    )),
      
                      if(clienteForm.tieneUbicacion)
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
                                                if(clienteForm.llenaData(ObjetoProspecto!)){
                                                  String FecNac = ObjetoProspecto!.fechaNacimiento;
                                                  print('Fecha NAcimientO: $FecNac');
                                                  _scaleController!.forward();
                                                }
                                                else {
                                                  CustomBgAlertBox(
                                                      context: context,
                                                      title: 'Error al registrar datos',
                                                      infoMessage: 'Ingresa todos los campos solicitados.',
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

class _ClienteForm extends StatelessWidget {
  bool _isObscured = true;
  ProspectoType? ObjetoProspecto;

  TextEditingController _Controller = TextEditingController();
  AnimationController? _scaleController;
  AnimationController? _scale2Controller;
  AnimationController? _widthController;
  AnimationController? _positionController;

  Animation<double>? _scaleAnimation;
  Animation<double>? _scale2Animation;
  Animation<double>? _widthAnimation;
  Animation<double>? _positionAnimation;
  bool MostrarDatosCorreo = false;

  _ClienteForm(
    AnimationController? _scale_Controller,
    AnimationController? _scale2_Controller,
    AnimationController? _width_Controller,
    AnimationController? _position_Controller,

    Animation<double>? _scale_Animation,
    Animation<double>? _scale2_Animation,
    Animation<double>? _width_Animation,
    Animation<double>? _position_Animation,
    bool Mostrar_DatosCorreo,
     ProspectoType? ObjtProsp)
  {
    _scaleController = _scale_Controller;
    _scale2Controller = _scale2_Controller;
    _widthController = _width_Controller;
    _positionController = _position_Controller;

    _scaleAnimation = _scale_Animation;
    _scale2Animation = _scale2_Animation;
    _widthAnimation = _width_Animation;
    _positionAnimation = _position_Animation;
    MostrarDatosCorreo = Mostrar_DatosCorreo;
    ObjetoProspecto = ObjtProsp;
  }

  @override
  Widget build(BuildContext context) {
    final clienteForm = Provider.of<ProspectoTypeService>(context);
    
    Container IconoSeleccionado;
    print('Tiene coordenadas: $MostrarDatosCorreo');
    clienteForm.tieneUbicacion = CoordenadasRes;
    Color ColorBotonOpacidad;

    if(clienteForm.tieneUbicacion){
      ColorBotonOpacidad = Colors.orange.withOpacity(.4);
     IconoSeleccionado = Container(child: const Icon(Icons.check, color: Colors.green, size: 37,));

    }
    else{
      ColorBotonOpacidad = Colors.grey.withOpacity(.4);
      IconoSeleccionado = Container();
      
    }
    
    return Container(
      decoration: const BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/FrmDatosPersonales.png'), 
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
                          padding: EdgeInsets.all(20.0),
                          
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                      CupertinoPageRoute(builder: (context) => TipoIdentificacionScreen()),
                                                                    ),
                                                  //Navigator.of(context, rootNavigator: true).pop(context),
                                                  
                                              ),
      
                                    Text('Paso 3 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
      
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

                                SizedBox(height: 10,),
          
          
                                SizedBox(height: 40,),
                                
                                Center(
                                        child: Text('Sabemos que trabajas en',style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'champagne_limous'),),
                                          
                                      ),
                              
                                SizedBox(height: 5,),
                         
                               Center(
                                        child: Text(ObjetoProspecto!.grupoEmpresarial,style: TextStyle(color: Colors.orange[700], fontSize: 24),),
                                          
                                      ),
          
                                    
                               SizedBox(height: 7,),
          
                               Center(
                                  child: Text('y que tu número celular es',style: TextStyle(color: Colors.white, fontSize: 24),),                              
                                ),
                                SizedBox(height: 5,),
                                
                                Center(
                                    child: Text(ObjetoProspecto!.celular,style: TextStyle(color: Colors.white, fontSize: 24),),
                                          
                                ),
                                    
                      const SizedBox(height: 28,),
          
                      Center(
                        child: Text('Cuéntanos un poco más de ti...',style: TextStyle(color: Colors.orange[700], fontSize: 24),),                
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
                                            height: 123,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  const SizedBox(width: 2,), 
                                                                  const Text('', style: TextStyle(color: Colors.white, ),),
                                                                  const Text('Nací el ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 110,
                                                                        width: MediaQuery.of(context).size.width - 141,
                                                                        /*
                                                                        child: 
                                                                        TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7),
                      theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                        ObjetoProspecto!.fechaNacimiento = date.toString();
                  }, onConfirm: (date) {
                    print('confirm $date');
                    ObjetoProspecto!.fechaNacimiento = date.toString();
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  ObjetoProspecto!.fechaNacimiento,
                  style: const TextStyle(color: Colors.white),
                )),
                                                                        */

                                                                        
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                                                          
                                                                          child: TextFormField(

                                                                            controller: _Controller,
                                                                            readOnly: true,
                                                                            autofocus: true,
                                                                            style: const TextStyle(color: Colors.white),
                                                                            validator: (value) {
                                                                              _Controller.text = ObjetoProspecto!.fechaNacimiento;
                                                                            },
                                                                            decoration: InputDecorations.authInputDecoration(
                                                                              colorTexto: Colors.white,
                                                                              EsContrasenia: false,
                                                                              colorBordes: Colors.white,
                                                                              TamanioIcono: 35,
                                                                              hintText: '',
                                                                              labelText: '',
                                                                              sufixIcon: Icons.calendar_month_outlined,
                                                                              OnPress: () async {
                                                                                DateTime FechaActual = DateTime.now();
                                                                                int AnioActual = FechaActual.year;
                                                                                int AnioValido = AnioActual - 18;
                                                                                DateTime? SelectedDate = await showDatePicker(
                                                                                  cancelText: 'Cancelar',
                                                                                  confirmText: 'Ok',
                                                                                  fieldLabelText: 'Mes/Día/Año',
                                                                                  helpText: '',
                                                                                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                                                                                  errorFormatText: 'Formato inválido',
                                                                                  context: context, 
                                                                                  initialDate: DateTime(1920),
                                                                                  firstDate: DateTime(1920), 
                                                                                  lastDate: DateTime(AnioValido + 1),
                                                                                  builder: (context,child) {
                                                                                    return Theme(
                                                                                      child: child!,
                                                                                      data: Theme.of(context).copyWith(
                                                                                      colorScheme: const ColorScheme.light(
                                                                                        primary: Colors.orange,
                                                                                        onPrimary: Colors.black
                                                                                      ),
                                                                                      textButtonTheme: TextButtonThemeData(
                                                                                        style: TextButton.styleFrom(primary: Colors.black)
                                                                                      )
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                                              
                                                                                                            );
                                                                                                            if(SelectedDate != null){
                                                                                                              _Controller.text = DateFormat('dd-MM-yyyy').format(SelectedDate);
                                                                                                              ObjetoProspecto!.fechaNacimiento = DateFormat('dd-MM-yyyy').format(SelectedDate);
                                                                                                              /*
                                                                                                              setState(() {
                                                                                                                hideIcon = true;
                                                                                                              });
                                                                                                              */
                                                                                                              
                                                                                                            }
                                                                                                            else {
                                                                                                              _Controller.text = ObjetoProspecto!.fechaNacimiento;
                                                                                                            }
                                                                                                            //clienteForm.FechaNacimiento = _Controller.text;
                                                                                                            ObjetoProspecto!.fechaNacimiento = _Controller.text;
                                                                                                            
                                                                                                          }
                                                                                                        ),
                                                                            ),

                                                                         
                                                                      ),
                                                                        
                                                                    ),
                                                                  ],
                                                                  
                                                                ),
      
                                                                Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        ),
                                      )),
                                    )),
                                    //Text(_Controller.text,style: TextStyle(color: Colors.white,)),
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
                                            height: 84,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                            Text('Mi género es ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                            
                                                                            Container(
                                                                                height: 100,
                                                                                width: MediaQuery.of(context).size.width - 220,
                                                                                child: Center(
                                                                                  child: DropdownButtonFormField<String>(// Fernando Herrera video 93 el que tengo el 50% del curso
                                                                                  decoration: const InputDecoration(
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                                              borderSide: BorderSide(
                                                                                                                  color: Colors.white,
                                                                                                                ),
                                                                                                              ),
                                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Colors.white,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  labelStyle: TextStyle(color: Colors.grey),
                                                                                                                  
                                                                                              ),
                                                                                              value: ObjetoProspecto!.genero == '' ? 'S' : ObjetoProspecto!.genero,
                                                                                              dropdownColor: Colors.indigo[300],
                                                                                              //focusColor: Colors.orange,
                                                                                              style: TextStyle(color: Colors.white),
                                                                                              //isExpanded: true,
                                                                                              items: const [
                                                                                                  DropdownMenuItem(value: 'S', child: Text('-- Seleccione --')),
                                                                                                  DropdownMenuItem(value: 'M', child: Text('Masculino')),
                                                                                                  DropdownMenuItem(value: 'F', child: Text('Femenino')),
                                                                                              ],
                                                                                              onChanged: (value) 
                                                                                              {
                                                                                                  //clienteForm.Genero = value.toString();
                                                                                                  //Cliente.Genero = value.toString();
                                                                                                  ObjetoProspecto!.genero = value.toString();
                                                                                              },
                                                                                            ),
                                                                                                ),
                                                                                 
                                                                                      ),
      
                                                                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        height: 110,
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  Text('', style: TextStyle(color: Colors.white, ),),
                                                                  Text('Y vivo en ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                            
                                                                  Container(
                                                                      
                                                                      height: 140,
                                                                      width: MediaQuery.of(context).size.width - 184,
                                                                                                //width: 350,//360,
      
                                                                                                child: Center(
                                                                                                  child: TextFormField(
                                                                                                    initialValue: ObjetoProspecto!.direccion,
                                                                                                    onChanged: (value) //=> clienteForm.Direccion = value,
                                                                                                    {
                                                                                                      clienteForm.Direccion = value;
                                                                                                      //Cliente.Direccion = value;
                                                                                                      ObjetoProspecto!.direccion = value;
                                                                                                    },
                                                                                                style: const TextStyle(color: Colors.white),
                                                                                                                                                                                                            
                                                                                                        maxLines: 3,
                                                                                                        
                                                                                                        //textCapitalization: TextCapitalization.words,
                                                                                                        
                                                                                                        validator: (value){
                                                                                                          ObjetoProspecto!.direccion = value;
                                                                                                        },
                                                                                                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                                        decoration: InputDecorations.authInputDecoration(
                                                                                                          EsContrasenia: false,
                                                                                                          colorBordes: Colors.white,
                                                                                                          colorTexto: Colors.white,
                                                                                                          TamanioIcono: 35,
                                                                                                                  hintText: '',
                                                                                                                  labelText: '',
                                                                                                                  //sufixIcon: Icons.calendar_month_outlined,
                                                                                                                  OnPress: (){}
                                                                                                                ),
                                                                                                      ),
                                                                                   
                                                                                                ),
                                                                                 
                                                                                      ),
      
                                                                                  Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        ),
                                      )),
                                    )),
      
      //UBicación
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
                                            height: 100,
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                    Text('', style: TextStyle(color: Colors.white, ),),
                                                                    
                                                                    Text('En esta ubicación ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                            //FrmDatosPersonales(),
                                                                    Container(
                                                                      width: 80,
                                                                      height: 400,
                                                                      child:
                                                                        GestureDetector(
                                                                                  /*
                                                                                        onTap: (){
                                                                                          /*
                                                                                          Navigator.push(
                                                                                            context,
                                                                                            CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()),
                                                                                          );
                                                                                          */
                                                                                          Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()));
                                                                                        },
                                                                                        */
            
                                                                                        /*
                                                                                        child: Container(
                                                                                          width: 60,
                                                                                          height: 60,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                            color: Colors.green[600]
                                                                                          ),
                                                                                          child: const Center(child:  Image(image: AssetImage('assets/IcMapaPaso3.png'), fit: BoxFit.cover, height: 40,)),
                                                                                        )
                                                                                        */
            
                                                                                        child: FadeAnimation(1.6, AnimatedBuilder(
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
                                                                                                  color: ColorBotonOpacidad
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  onTap: () {
                                                                                                    //Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => MapaUbicacionRegistroScreen()));
                                                                                                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: LoadingScreen(Obj_Prospect: ObjetoProspecto,)));
                                                                                                    //Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: const AccessGpsScreen()));
                                                                                                    /*
                                                                                                    print('Entra');
                                                                                                    final gpsBloc = BlocProvider.of<GpsBloc>(context);
                                                                                                    gpsBloc.askGpsAccess();
                                                                                                    */
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
                                                                                                                  color: ColorBotonOpacidad
                                                                                                                ),
                                                                                                                child: FadeAnimation(1.6, AnimatedBuilder(
                                                                                          animation: _scaleController!,
                                                                                          builder: (context, child) => Transform.scale(
                                                                                          scale: _scaleAnimation!.value,
                                                                                          child: Center(
                                                                                            child: AnimatedBuilder(
                                                                                              animation: _widthController!,
                                                                                              builder: (context, child) => Container(
                                                                                                width: _widthAnimation!.value,
                                                                                                height: 60,
                                                                                                padding: EdgeInsets.all(10),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(50),
                                                                                                  color: ColorBotonOpacidad
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  
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
                                                                                                                width: 40,
                                                                                                                height: 38,
                                                                                                                child: Container(child: Image(image: AssetImage('assets/IcMapaPaso3.png'), fit: BoxFit.cover, height: 50,))
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
                                                                                    
                                                                                        
                                                                                      )
                                                                                
                                                                                
                                                                              ),

                                                                      IconoSeleccionado,
                                                                            
                                                                      
                                                                          Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),  
                                                                            
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
                                        ),
                                      )),
                                    )),
                                   
                      if(clienteForm.tieneUbicacion)
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
                                            height: 40,
                                            padding: const EdgeInsets.all(10),
                                            child: InkWell(
                                                child: Stack(
                                                  children: <Widget> [
                                                    Center(
                                                      child: AnimatedBuilder(
                                                        animation: _positionController!,
                                                        builder: (context, child) => Positioned(
                                                          //left: _positionAnimation!.value,
                                                          left: 1,
                                                          child: AnimatedBuilder(
                                                            animation: _scale2Controller!,
                                                            builder: (context, child) => Transform.scale(
                                                              scale: _scale2Animation!.value,
                                                              child: Container(
                                                                //color: Colors.white,
                                                                child: Row(
                                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: const [
                                                                      SizedBox(width: 20,),
                                                                      Text('Mi correo electrónico es ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                      Text(' ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                                  ],),
                                                              ),
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
      
                      if(clienteForm.tieneUbicacion)
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
                                            width: MediaQuery.of(context).size.width - 70,
                                            height: 80,
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                                      child: TextFormField(
                                                        initialValue: ObjetoProspecto!.email,
                                                        onChanged: (value) //=> clienteForm.Correo = value,
                                                        {
                                                          clienteForm.Correo = value;
                                                          //Cliente.Correo = value;
                                                          ObjetoProspecto!.email = value;
                                                                  //setState(() {});
                                                        },
                                                        autocorrect: false,
                                                        keyboardType: TextInputType.emailAddress,//tipo de imput -> correo
                                                        style: const TextStyle(color: Colors.white),
                                                        decoration: InputDecorations.authInputDecoration(
                                                          TamanioIcono: 20,
                                                          colorBordes: Colors.white,
                                                          EsContrasenia: false,
                                                          hintText: 'avaldiviezo@riasem.com.ec',
                                                          labelText: '',
                                                          OnPress: (){}
                                                        ),
                                                        validator: (value) {
                                                          String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                          RegExp regExp  = RegExp(pattern);
                                                          return regExp.hasMatch(value ?? '') ? null : 'Correo invalido';
                                                                                              
                                                        },
                                              ),
                                            ),
                
                                          ),
                                        ),
                                      )),
                                    )),
      
                      if(clienteForm.tieneUbicacion)
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
                                                if(clienteForm.llenaData(ObjetoProspecto!)){
                                                  String FecNac = ObjetoProspecto!.fechaNacimiento;
                                                  print('Fecha NAcimientO: $FecNac');
                                                  _scaleController!.forward();
                                                }
                                                else {
                                                  CustomBgAlertBox(
                                                      context: context,
                                                      title: 'Error al registrar datos',
                                                      infoMessage: 'Ingresa todos los campos solicitados.',
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
    );

    
    }
  }

  