/*
import 'package:enroll_app/screens/index.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:provider/provider.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {

static const String routerName = 'authentication';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(image: AssetImage('assets/LogoRiasemGrande.png'), height: 45, width: 300,),
                    SizedBox(height: 30),
                    ChangeNotifierProvider(//practicar mas de esto, minuto 10:25 del video 212
                      create: (_) => LoginFormService(),
                      child: _AuthenticationScreenForm(),
                    ),
                ],)
              ),
              SizedBox(height: 50,),
              //Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
          ]),
          )
      ),
   );
  }
}

class _AuthenticationScreenForm extends StatelessWidget {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormService>(context);

    return Container(
      child: Form(
        key: loginForm.FormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,//tipo de imput -> correo
              decoration: InputDecorations.authInputDecoration(
                TamanioIcono: 20,
                EsContrasenia: false,
                hintText: 'avaldiviezo@riasem.com.ec',
                labelText: 'Correo electrónico',
                prefxIcon: Icons.alternate_email_rounded,
                OnPress: (){}
              ),
              onChanged: (value) => loginForm.Email = value,
              validator: (value) {
                /*
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Correo invalido';
                */
              },
            ),
            SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: loginForm.IsOscured,
              keyboardType: loginForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
              textInputAction: TextInputAction.done,
              decoration: InputDecorations.authInputDecoration(
                TamanioIcono: 20,
                EsContrasenia: true,
                hintText: '*****',
                labelText: 'Contraseña',
                prefxIcon: Icons.lock_outline,
                sufixIcon: loginForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                OnPress: () {
                  loginForm.IsOscured = !loginForm.IsOscured;
                },
              ),
              onChanged: (value) => loginForm.PassWord = value,
              validator: (value) {
                if(value != null && value.length >= 1 ) {
                  return null;
                }
                return 'Ingrese contraseña';
              },
            ),
                          
            SizedBox(height: 30,),

            loginForm.IsLoading ? 
            CircularProgressIndicator()
            :
            MaterialButton(
              shape: CircleBorder(),
              disabledColor: Colors.grey,
              elevation: 0,
                color: Colors.orange[300],
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    icon: const Icon(Icons.login_outlined,color: Colors.white, size: 35,),
                    onPressed: () async{
                      FocusScope.of(context).unfocus();
                      if(!loginForm.isValidForm()) return;
                      loginForm.IsLoading = true;
                      /*
                      if(!loginForm.Login(loginForm.Email, loginForm.PassWord)) {
                        await Future.delayed(const Duration(seconds: 2));
                        CustomBgAlertBox(
                          context: context,
                          title: 'Error al iniciar sesión',
                         // messageText: 'Usuario o clave incorrecta',
                         infoMessage: 'Usuario o clave incorrecta',
                          buttonColor: Colors.red,
                          buttonText: 'Cerrar',
                          icon: Icons.close_rounded,
                          titleTextColor: Colors.red[400],
                          );
                          loginForm.IsLoading = false;
                        return;
                      }
                      */
                      loginForm.IsLoading = false;
                      Navigator.pushReplacementNamed(context, PrincipalScreen.routerName);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(false,false)),);
                    },
                  ),
                ),
                
              onPressed: () async{
                FocusScope.of(context).unfocus();
                if(!loginForm.isValidForm()) return;
                loginForm.IsLoading = true;
                await Future.delayed(const Duration(seconds: 2));
/*
                if(!loginForm.Login(loginForm.Email, loginForm.PassWord)) {
                  
                  CustomBgAlertBox(
                    context: context,
                    title: 'Error al iniciar sesión',
                          //messageText: 'Usuario o clave incorrecta',
                    infoMessage: 'Usuario o clave incorrecta',
                    buttonColor: Colors.red,
                    buttonText: 'Cerrar',
                    icon: Icons.close_rounded,
                    titleTextColor: Colors.red[400],
                 );
                 loginForm.IsLoading = false;
                 return;
                }
*/
                loginForm.IsLoading = false;
                Navigator.pushReplacementNamed(context, PrincipalScreen.routerName);
              },

            )
        ,
        ],)
      ),
    );
  }
}
*/

import 'dart:io';
import 'package:enroll_app/eventos_widgets/index.dart';
import 'package:enroll_app/helpers/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

String NumIdentAut = '';

class AuthenticationScreen extends StatefulWidget {

  static const String routerName = 'tipoidentificacion';
  @override
  _AuthenticationScreen createState() => _AuthenticationScreen();

}

class _AuthenticationScreen extends State<AuthenticationScreen>{
  TextEditingController? _Controller;

  @override
  void initState(){
    _Controller = TextEditingController();
    super.initState();
  }
  
  List<Color> LstColores = [
    Color.fromARGB(31, 0, 0, 0),
    Color.fromARGB(66, 0, 0, 0),
  ];

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
                      image: AssetImage('assets/InicioSesion.png'), 
                      fit: BoxFit.cover,
                  ),
                  
                  color: Colors.transparent
                ),
                
              
                child: ChangeNotifierProvider(
                  create: (_) => AutenticacionService(),
                  child: TipoIdentEvntLog(_Controller!),
                ),              
            ),
          ),
        /*
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton(
                elevation: 1,
                onPressed: () => exit(0), 
                backgroundColor: Colors.white12,
                child: const Icon(Icons.cancel_outlined, size: 35,),
              ),
      */
      ),
    )
   
     ;
     
  }
}

class TipoIdentEvntLog extends StatelessWidget {

  TextEditingController? _Controller;

  TipoIdentEvntLog(TextEditingController ContValida){
    _Controller = ContValida;
  }


  @override
  Widget build(BuildContext context) {
    final tipoIdentificacion = Provider.of<AutenticacionService>(context);
    final SizeScreen = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40,),
                    
          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                
                          MaterialButton(
                              shape: const CircleBorder(),
                              disabledColor: Colors.white,
                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                              onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
                          ),
                                 
                          MaterialButton(
                                    shape: CircleBorder(),
                                    disabledColor: Colors.white,
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Container(child: Icon(Icons.close,color: Colors.white,size: 39,),),
                                    onPressed: () => exit(0),                                   
                          ),                            
                        
                        ],
                      ),                      
                      
          Container(color: Colors.transparent, height: 180, child: Expanded(child: Row())),

          Container (
            color: Colors.transparent,
                        child: const Image(
                              image: AssetImage('assets/IcInicioSesion.png',),
                          ),
                      ),

          Row(children: [
                          const SizedBox( width: 90,),
                          Column(
                            children: const [
                              Text('con mi', style: TextStyle(color: Colors.white, fontSize: 30),),
                            ]
                          ),
                        ]
                      ),
        
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 80,),
                            
                              Container(
                                color: Colors.transparent,
                                child: Column(
                                      children: [
                                          const SizedBox(height: 1, width: 70,),                                        
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
                                                      
                                                      height: 50,
                                                      width: 60,
                                                      
                                                      color: Colors.transparent,
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
                                                      height: 50,
                                                      width: 60,
                                                      color: Colors.transparent,
                                                      child: Image(
                                                        image: AssetImage(tipoIdentificacion.PasaporteSelect),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                      ],
                                    ),
                              ),
                              Column(
                                    children: [
                                      const SizedBox(height: 17,),
                                       Container(
                                        color: Colors.transparent,
                                                  //height: 100,
                                                  width: SizeScreen.width - 250,//360,
                                                  child: ValidacionAuthenticationForm(tipoIdentificacion.IsPasaporte,_Controller!),
                                        )
                                      ],
                                  ),

                                  const SizedBox(width: 1,),
                            
                          ],
                        ),
          
          const SizedBox(height: 30,),
                    
          Container(
                        color: Colors.transparent,
                          width: SizeScreen.width - 200, // ancho para el botón
                          height: 55, // alto para el botón
                          child: 
                            MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                disabledColor: Colors.grey,
                                elevation: 10,
                                color: Colors.orange[900],
                                child: Container(
                                  color: Colors.transparent, 
                                  child: !tipoIdentificacion.IsLoading ?
                                  const Text('Continuar',style: TextStyle(color: Colors.white, fontSize: 20))
                                  :
                                  SpinKitFadingCircle(
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: index.isEven ? Colors.black12 : Colors.white,
                                      ),
                                    );
                                  },)
                                ),
                                onPressed: () async {
                                  tipoIdentificacion.IsLoading = true;
                                  await Future.delayed(const Duration(seconds: 6));
                                  String respt = tipoIdentificacion.ValidaCedula(tipoIdentificacion.Cedula);
                                  tipoIdentificacion.IsLoading = false;
                                  print('Cedula: ${tipoIdentificacion.Cedula}');
                                  if(respt!.toLowerCase() == 'ok'){
                                    
                                    Navigator.push(
                                          context,
                                          CupertinoPageRoute(builder: (context) => ContraseniaScreen(NumIdentificacion: tipoIdentificacion.Cedula)),
                                        );
                                  }
                                  else{
                                    CustomBgAlertBox(
                                        context: context,
                                        title: '!UPS¡',
                                        infoMessage: 'Ingresa número de identificación válido',
                                        buttonColor: Colors.red,
                                        buttonText: 'Cerrar',
                                        //icon: Icons.close_rounded,
                                        icon: Icons.cancel,
                                        titleTextColor: Colors.red[400],
                                    );
                                  }
                                  
                                }
                            
                            ),
                         
                         ),

          //Container(color: Colors.red, height: 150, child: Expanded(child: Row())),
          Expanded(child: Row()),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20,),

              const  SizedBox(width: 25,),

              GestureDetector(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 62,
                    width: 125,
                                                    color: Colors.transparent,
                                                    child: const Image(
                                                      image: AssetImage('assets/PrimeraVez.png'),
                                                    ),
                                        
                                                  ),
                                                  
                                                ),
                                        ),
                                 
                            Container(
                              color: Colors.transparent,
                              width: 160, // alto para el botón
                              child: 

                                MaterialButton(
                                              child: Container(child: Text('Sí, quiero suscribirme',style: TextStyle(color: Colors.orange[700], fontSize: 15))),
                                              onPressed: (){

                                                Navigator.pushReplacement(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (BuildContext context) => TipoIdentificacionScreen(),
                                                  ),
                                                );
                                              

                                            },
                                            
                                          ),
                            ),
                        
                            SizedBox(width: 20,),
                          ],
                        ),

          
          const SizedBox(height: 20,),

        ],
      ),
    );
  
  }
}


class ValidacionAuthenticationForm extends StatelessWidget {

TextEditingController? _ControllerValidar;
  bool Es_Pasaporte = false;
  ValidacionAuthenticationForm(bool EsPasaporte, TextEditingController _Controller_Validar){
    Es_Pasaporte = EsPasaporte;
    _ControllerValidar = _Controller_Validar;
  }


  @override
  Widget build(BuildContext context) {
    final tipoIdentificacion = Provider.of<AutenticacionService>(context);

    return Container(
      child: Form(
        key: tipoIdentificacion.FormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Es_Pasaporte ?
               TextFormField(
                controller: _ControllerValidar,
                style: const TextStyle(color: Colors.white,),
                autocorrect: false,                                    
                keyboardType: TextInputType.text,
                //onChanged: (value) => tipoIdentificacion.Pasaporte = value,
                onChanged: (value)  {
                    tipoIdentificacion.Pasaporte = value;
                    NumIdentAut = value;
                  },
                maxLength: 19,
                decoration: InputDecorations.authInputDecoration(
                  colorTexto: Colors.white,
                  
                  TamanioIcono: 20,
                  EsContrasenia: false,
                              hintText: '',
                              colorBordes: Colors.white,
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
                  onChanged: (value)  {
                    tipoIdentificacion.Cedula = value;
                    NumIdentAut = value;
                  },
                  /*
                  onChanged: (value) => {
                    if(tipoIdentificacion.ValidaCedula(value) == 'Ok') {

                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => OtpScreen(value)),
                      ),
                    }                               
                    else{
                      
                    }
                  },
                  */
                  validator: (value) {
                    String respt = 'Ok';
                    if(value != null && value != '' && value.length > 9){
                      respt = tipoIdentificacion.ValidaCedula(value.toString());
                    }
                    return respt == 'Ok' ? null : 'Cédula inválida.';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    colorTexto: Colors.white,
                    TamanioIcono: 20,
                    EsContrasenia: false,
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
