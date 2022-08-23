import 'dart:async';
import 'dart:io';
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
import 'package:provider/provider.dart';
import 'package:status_change/status_change.dart';



class TipoIdentificacionScreen extends StatefulWidget {

  static const String routerName = 'tipoidentificacion';
  @override
  _TipoIdentificacionScreen createState() => _TipoIdentificacionScreen();

}

class _TipoIdentificacionScreen extends State<TipoIdentificacionScreen>{

  TextEditingController? _Controller;

  @override
  void initState(){
    _Controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeScreen = MediaQuery.of(context).size;
    String CedulaSelect = 'assets/BtnCedula_Blanco.png';
    String PasaporteSelect = 'assets/BtnPasaporte_Blanco.png';

    return  MaterialApp(
        
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
      body: Center(
              child: Container(    
                
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/TipoIdentificacionSusc.png'), 
                  fit: BoxFit.cover,
                ),
              ),              
              
              child: ChangeNotifierProvider(
                  create: (_) => TipoIdentificacionEvent(),
                  child: TipoIdentEvnt(_Controller!),
              ),
              
            ),
          ),
      
      ),
    )
   
     ;
     
  }
}

class TipoIdentEvnt extends StatelessWidget {
  bool _isObscured = true;
  TextEditingController? _Controller;

  TipoIdentEvnt(TextEditingController ContValida){
    _Controller = ContValida;
  }

  @override
  Widget build(BuildContext context) {
    final tipoIdentificacion = Provider.of<TipoIdentificacionEvent>(context);
    final SizeScreen = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 45,),
                    
          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                
                            MaterialButton(
                                    shape: CircleBorder(),
                                    disabledColor: Colors.white,
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Container(child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                    onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
                                    
                                ),
                                    /*
                                    {
                                          print('Atrás');
                                          Navigator.pop(context);
                                                //Navigator.pushReplacementNamed(context, 'splash3');
                                                //Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3()),);
                                              },
                            ),
                                          */
                                //SizedBox(height: 5,),
                                Text('Paso 1 de 4',style: TextStyle(color: Colors.white, fontSize: 20),),
                                MaterialButton(
                                        shape: CircleBorder(),
                                        disabledColor: Colors.white,
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Container(child: Icon(Icons.close,color: Colors.white,size: 39,),),
                                        onPressed: () => //print('Salir')
                                          exit(0), 
                                      ),
                              /*
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                          SizedBox(height: 10,),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: MaterialButton(
                                              shape: CircleBorder(),
                                              disabledColor: Colors.white,
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child: Container(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                                //Navigator.pushReplacementNamed(context, 'splash3');
                                                //Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3()),);
                                              },
                                          ),
                                        ),
                                     ],
                                    ),
                                  ),
                                 */
                                  /*                
                                  Column(
                                    children: [
                                      SizedBox(height: 38, ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: MaterialButton(
                                        shape: CircleBorder(),
                                        disabledColor: Colors.white,
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Container(child: Icon(Icons.cancel_outlined,color: Colors.white,size: 39,),),
                                        onPressed: (){},
                                        
                                      ),
                                      ),                             
                                    ],
                                  ),                          
                           */
                            ],),
                        
          const Expanded(
                        child: Center(),
                      ),
        
          Expanded(
                        child: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  const Text('', style: TextStyle(color: Colors.white, ),),
                                   
                                  Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      
                                      children: [
                                        const SizedBox(height: 35, width: 7,),
                                        GestureDetector(
                                          onTap: (){
                                            tipoIdentificacion.CedulaSelect = 'assets/BtnCedula_Gris.png';
                                            tipoIdentificacion.PasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
                                            tipoIdentificacion.IsPasaporte = false;
                                            _Controller!.clear();
                                            FocusScope.of(context).unfocus();
                                          },
                                          child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                  color: Colors.transparent,
                                                  height: 55,
                                                  width: 60,
                                                  child: Image(
                                                      image: AssetImage(tipoIdentificacion.CedulaSelect),
                                                  ),
                                          
                                                    ),
                                                    
                                                  ),
                                          ),
                                        GestureDetector(
                                            onTap: (){
                                              tipoIdentificacion.CedulaSelect = 'assets/BtnCedula_Blanco.png';
                                              tipoIdentificacion.PasaporteSelect = 'assets/BtnPasaporte_Gris.png';
                                              tipoIdentificacion.IsPasaporte = true;
                                              _Controller!.clear();
                                              FocusScope.of(context).unfocus();
                                            },
                                            child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      height: 55,
                                                      width: 60,
                                                      child: Image(
                                                        image: AssetImage(tipoIdentificacion.PasaporteSelect),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          
                                      ],
                                    ),
                                  ),
                                  
                                  Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 60,),
                                        Container(
                                          color: Colors.transparent,
                                                    height: 72,
                                                    width: SizeScreen.width - 150,
                                                    child: ValidacionForm(tipoIdentificacion.IsPasaporte,_Controller!),
                                          )
                                        ],
                                    ),
                                  ),
                                  

                                  const Text('', style: TextStyle(color: Colors.white, ),),
                            ],),
                        
                      ),

                      const SizedBox(height: 110,),
                    ],
                  ),
       
      // ),

      //),
    );
  }
}

class ValidacionForm extends StatelessWidget {
  TextEditingController? _ControllerValidar;
  bool Es_Pasaporte = false;
  ValidacionForm(bool EsPasaporte, TextEditingController _Controller_Validar){
    Es_Pasaporte = EsPasaporte;
    _ControllerValidar = _Controller_Validar;
  }


  @override
  Widget build(BuildContext context) {
    final tipoIdentificacion = Provider.of<ProspectoTypeService>(context);

    return Container(
      child: Form(
        key: tipoIdentificacion.FormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Es_Pasaporte ?
              TextFormField(
                controller: _ControllerValidar,
                style: TextStyle(color: Colors.white,),
                autocorrect: false,                                    
                keyboardType: TextInputType.text,
                maxLength: 19,
                /*
                onChanged: (value) {
                  if(Es_Pasaporte){
                    tipoIdentificacion.Cedula = '';
                  }
                  tipoIdentificacion.Cedula = value;
                  var ProspResp = tipoIdentificacion.getProspecto('P',value);
                  Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => OtpScreen(ProspResp)),
                      );
                },
                */
                decoration: InputDecorations.authInputDecoration(
                  TamanioIcono: 20,
                  EsContrasenia: false,
                  hintText: '',
                  colorBordes: Colors.white,
                  colorTexto: Colors.white,
                  labelText: 'Pasaporte',
                  prefxIcon: null,
                  OnPress: (){}
                ),
                validator: (value) {
                                                      /*
                                                      if(tipoIdentificacion.ValidaCedula(value!) == 'Ok') {
                                                        //Navigator.pushReplacement(context, 'otponboarding');
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(value)),);
                                                      }                                                       
                                                       else{
                                                          return tipoIdentificacion.ValidaCedula(value);
                                                       }
                                                       */
                                                    },
              )
              :
              TextFormField(
                controller: _ControllerValidar,
                style: const TextStyle(color: Colors.white),
                maxLength: 10,
                autocorrect: false,
                keyboardType: TextInputType.number,
                onChanged: (value) async {
                  if(!Es_Pasaporte){
                    tipoIdentificacion.Cedula = '';
                  }
                tipoIdentificacion.Cedula = value;
                if(tipoIdentificacion.ValidaCedula(value) == 'Ok') {
                  showDialog(
                    barrierDismissible: false,
                    context: context, 
                    builder: (context) => 
                    SimpleDialog(
                      alignment: Alignment.center,
                      children: [
                          SimpleDialogCargando(MensajeMostrar: 'estamos validando tu identificación',MensajeMostrar_2: ''),
                      ]
                    ),
                  );
                  await tipoIdentificacion.getProspecto('C',value);
                  if(tipoIdentificacion.ObjTipoRsp!.succeeded && tipoIdentificacion.ObjTipoRsp!.statusCode == '000'){
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => OtpScreen(tipoIdentificacion.Obj_Rsp)),
                    );
                      
                  }
                  else {
                    Navigator.of(context, rootNavigator: true).pop();
                    if(!tipoIdentificacion.ObjTipoRsp!.succeeded && tipoIdentificacion.ObjTipoRsp!.statusCode == '001'){//Cliente registrado
                      CustomBgAlertBox(
                                        context: context,
                                        title: 'Error en la suscripción',
                                        infoMessage: tipoIdentificacion.ObjTipoRsp!.message,
                                        buttonColor: Colors.red,
                                        buttonText: 'Cerrar',
                                        //icon: Icons.close_rounded,
                                        icon: Icons.cancel,
                                        titleTextColor: Colors.red[400],
                                    );
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => AuthenticationScreen()),
                    );
                    }
                    if(!tipoIdentificacion.ObjTipoRsp!.succeeded && tipoIdentificacion.ObjTipoRsp!.statusCode == '002'){ //Pendiente de   activación del servicio
                      CustomBgAlertBox(
                                        context: context,
                                        title: 'Error en la suscripción',
                                        infoMessage: tipoIdentificacion.ObjTipoRsp!.message,
                                        buttonColor: Colors.red,
                                        buttonText: 'Cerrar',
                                        //icon: Icons.close_rounded,
                                        icon: Icons.cancel,
                                        titleTextColor: Colors.red[400],
                                    );
                    }
                    if(!tipoIdentificacion.ObjTipoRsp!.succeeded && tipoIdentificacion.ObjTipoRsp!.statusCode == '003'){ // No es prospecto
                      Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => IdentificacionErrorScreen()),
                        );
                    }
                  }  
                      
                }                               
                else{
                      
                  }
                },
                validator: (value) {
                    String respt = 'Ok';
                    if(value != null && value != '' && value.length > 9){
                      respt = tipoIdentificacion.ValidaCedula(value.toString());
                    }
                    return respt == 'Ok' ? null : 'Cédula inválida.';
                },
                decoration: InputDecorations.authInputDecoration(
                  TamanioIcono: 20,
                  EsContrasenia: false,
                  colorTexto: Colors.white,
                          hintText: '',
                          colorBordes: Colors.white,
                          labelText: 'Cédula',
                          prefxIcon: null,
                          OnPress: (){}
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],                  
              ),
               
      ),
    );
  }
}

void cierraModal (context) {
  Navigator.pop(context);
}