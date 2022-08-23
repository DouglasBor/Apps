
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
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String NumIdVal = '';
bool Cargando = false;

class ContraseniaScreen extends StatefulWidget {

  String NumIdentificacion = '';
  ContraseniaScreen({required NumIdentificacion}){
    print('Núm Ident clave: $NumIdentificacion');
    NumIdVal = NumIdentificacion;
  }

  static const String routerName = 'contraseniascreen';
  @override
  _ContraseniaScreen createState() => _ContraseniaScreen();

}

class _ContraseniaScreen extends State<ContraseniaScreen>{
  
  String NumIdent = '';

  _ContraseniaScreen(){
    NumIdent = NumIdVal;
    print('Núm Ident clave 2: $NumIdVal');
  }

  List<Color> LstColores = [
    Color.fromARGB(31, 0, 0, 0),
    Color.fromARGB(66, 0, 0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    //final loginForm = Provider.of<AutenticacionService>(context);
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
                      image: AssetImage('assets/PassWord.png'), 
                      fit: BoxFit.cover,
                  ),
                  
                  color: Colors.transparent
                ),
                
              
                child: ChangeNotifierProvider(
                  create: (_) => AutenticacionService(),
                  child: PaswordEvntLog(),
    /*
                  child: Container(
          child: Column(
                    children: <Widget>[
                      const SizedBox(height: 45,),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                
                          MaterialButton(
                              shape: const CircleBorder(),
                              disabledColor: Colors.white,
                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                              onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),      
                              /*Navigator.pushReplacementNamed(
                                                context,
                                                AuthenticationScreen.routerName
                                              ),     
                                              */                         
                          ),
                                 
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
                        
                        
                      const SizedBox(height: 57),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('Mi contraseña', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('de acceso es', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                        ],
                      ),


                      // Text('Considerar mayúsculas y minúsculas', style: TextStyle(color: Colors.white, fontSize: 30),),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          
                          Container(
                            color: Colors.transparent,
                            height: 60,
                                                  width: SizeScreen.width -50,//330,//360,
                                                  child: TextFormField(
                                                    style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
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
                                                      colorBordes: Colors.white,
                                                      colorTexto: Colors.white,
                                                      sufixIcon: loginForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                        OnPress: () {
                                                          loginForm.IsOscured = !loginForm.IsOscured;
                                                        },
                                                    ),
                                                    onChanged: (value) => loginForm.PassWord = value,
                                                    validator: (value) {
                                                      if(value != null) {
                                                        return null;
                                                      }
                                                      return 'Ingrese contraseña';
                                                    },
                                                  ),
                                        ),
                                      

                          const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                        ],
                      ),
                      
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          //Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          SizedBox(width: 1,),
                          Text('Considerar mayúsculas y minúsculas', style: TextStyle(color: Colors.white, fontSize: 15),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                        ],
                      ),

                    const SizedBox(height: 50,),

                      Container(
                        color: Colors.transparent,
                          width: 330, // ancho para el botón
                          height: 55, // alto para el botón
                          child: 
                            MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                disabledColor: Colors.grey,
                                elevation: 10,
                                color: Colors.orange[900],
                                child: 
                                  Container(
                                    color: Colors.transparent, 
                                    child: !Cargando ? 
                                    const Text('Quiero iniciar sesión',style: TextStyle(color: Colors.white, fontSize: 20))
                                    :
                                    const SpinKitRotatingCircle(
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                onPressed: () async {
                                  Cargando = true;
                                  await loginForm.autenticacion(NumIdVal,loginForm.PassWord);
                                  Cargando = false;

                                  if(!loginForm.ObjRspInicioSesion!.succeeded){
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (context) => AutenticacionErrorScreen('Has ingresado','un dato incorrecto')),
                                      );
                                  }
                                  else {
                                    if(!loginForm.ObjRspUsuarioDatos!.succeeded) {
                                      CustomBgAlertBox(
                                        context: context,
                                        title: 'Error con información del usuario',
                                        infoMessage: 'Por favor, contactarse con sistemas',
                                        buttonColor: Colors.red,
                                        buttonText: 'Cerrar',
                                        //icon: Icons.close_rounded,
                                        icon: Icons.cancel,
                                        titleTextColor: Colors.red[400],
                                    );
                                    }
                                    else {
                                      //Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName);
                                      print('Datos llenos 2: ${loginForm.ObjRspUsuario!.apellidos}');
                                      //Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => PrincipalScreen()),);

                                      Future.microtask(() => 
                                        Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName)
                                      );
                                      
                                      
                                    }
                                    
                                  }
                                    FocusScope.of(context).unfocus();//para cerrar teclado del celular
                        
                                  },
                            
                            ),
                         ),


                      SizedBox(height: 10,),
                      

                      //SizedBox(height: 40, width: 20,),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(width: 20,),

                            SizedBox(width: 25,),
                                
                            GestureDetector(
                              /*
                                          onTap: (){
                                            tipoIdentificacion.CedulaSelect = 'assets/BtnCedula_Gris.png';
                                            tipoIdentificacion.PasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
                                            tipoIdentificacion.IsPasaporte = false;
                                          },
                                          */
                                          child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    height: 62,
                                                    width: 125,
                                                     child: Image(
                                                      image: AssetImage('assets/PrimeraVez.png'),
                                        
                                                    ),
                                        
                                                  ),
                                                  
                                                ),
                                        ),
                                 
                            Container(
                              width: 160, // alto para el botón
                              child: 

                                MaterialButton(
                                              child: Container(child: Text('Sí, quiero suscribirme',style: TextStyle(color: Colors.orange[700], fontSize: 15))),
                                              onPressed: (){

                                                /*
                                                RouteTransitions(
                                                  context: context,
                                                  child: AuthenticationScreen(),
                                                  animation: AnimationType.normal,
                                                  duration: const Duration( milliseconds: 20 ),
                                                  replacement: true
                                                );
                                                */

                                              /*
                                                Navigator.pushReplacement(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (BuildContext context) => TipoIdentificacionScreen(),
                                                  ),
                                                );
                                              */

                                              Navigator.pushReplacementNamed(
                                                context,
                                                TipoIdentificacionScreen.routerName,
                                              );

                                            },
                                            
                                          ),
                            ),
                        
                            SizedBox(width: 20,),
                          ],
                        ),

                      SizedBox(height: 10,),
                    ],
                  ),
       
      // ),

      //),
    )
  */
                ),              
            ),
          ),
      ),
    )
   
     ;
     
  }
}


class PaswordEvntLog extends StatelessWidget {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<AutenticacionService>(context);
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
                              shape: const CircleBorder(),
                              disabledColor: Colors.white,
                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(color: Colors.transparent, child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                              onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),      
                              /*Navigator.pushReplacementNamed(
                                                context,
                                                AuthenticationScreen.routerName
                                              ),     
                                              */                         
                          ),
                                 
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
                        
                        
                      Expanded(child: Row()),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                          Text('Mi contraseña', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                          Text('de acceso es', style: TextStyle(color: Colors.white, fontSize: 30),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                        ],
                    ),

                    //desde aquí
                    const SizedBox(height: 10,),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                          
                          Container(
                            color: Colors.transparent,
                            height: 60,
                                                  width: SizeScreen.width -50,//330,//360,
                                                  child: TextFormField(
                                                    style: const TextStyle(color: Colors.white),//Theme.of(context).textTheme.headline6,
                                                    autocorrect: false,
                                                    obscureText: loginForm.IsOscured,
                                                      
                                                    keyboardType: loginForm.IsOscured ? TextInputType.text : TextInputType.emailAddress,//tipo de imput -> correo
                                                    textInputAction: TextInputAction.done,
                                                    decoration: InputDecorations.authInputDecoration(
                                                      TamanioIcono: 20,
                                                      EsContrasenia: true,
                                                      hintText: '',
                                                      labelText: 'Contraseña',
                                                      prefxIcon: Icons.lock_outline,
                                                      colorBordes: Colors.white,
                                                      colorTexto: Colors.white,
                                                      sufixIcon: loginForm.IsOscured ? Icons.visibility_off : Icons.visibility,
                                                        OnPress: () {
                                                          loginForm.IsOscured = !loginForm.IsOscured;
                                                        },
                                                    ),
                                                    onChanged: (value) => loginForm.PassWord = value,
                                                    validator: (value) {
                                                      if(value != null) {
                                                        return null;
                                                      }
                                                      return 'Ingrese contraseña';
                                                    },
                                                  ),
                                        ),
                                      

                          const Text('', style: TextStyle(color: Colors.white, fontSize: 30),),  
                        ],
                      ),
                      
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('         Considerar mayúsculas y minúsculas', style: TextStyle(color: Colors.white, fontSize: 15),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                          Text('', style: TextStyle(color: Colors.white, fontSize: 1),),  
                        ],
                      ),

                    const SizedBox(height: 50,),

                      Container(
                        color: Colors.transparent,
                          width: 330, // ancho para el botón
                          height: 55, // alto para el botón
                          child: 
                            MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                disabledColor: Colors.grey,
                                elevation: 10,
                                color: Colors.orange[900],
                                child: 
                                  Container(
                                    color: Colors.transparent, 
                                    child: !loginForm.IsLoading ? 
                                    const Text('Quiero iniciar sesión',style: TextStyle(color: Colors.white, fontSize: 20))
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
                                  loginForm.IsLoading = true;
                                  await loginForm.autenticacion(NumIdVal,loginForm.PassWord);
                                  
                                  await Future.delayed(const Duration(seconds: 2));
                                  loginForm.IsLoading = false;

                                  if(!loginForm.ObjRspInicioSesion!.succeeded){
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (context) => AutenticacionErrorScreen('Has ingresado','un dato incorrecto')),
                                      );
                                  }
                                  else {
                                    if(!loginForm.ObjRspUsuarioDatos!.succeeded) {
                                      CustomBgAlertBox(
                                        context: context,
                                        title: 'Error con información del usuario',
                                        infoMessage: 'Por favor, contactarse con sistemas',
                                        buttonColor: Colors.red,
                                        buttonText: 'Cerrar',
                                        //icon: Icons.close_rounded,
                                        icon: Icons.cancel,
                                        titleTextColor: Colors.red[400],
                                    );
                                    }
                                    else {
                                      //Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName);
                                      print('Datos llenos 2: ${loginForm.ObjRspUsuario!.apellidos}');
                                      //Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => PrincipalScreen()),);

                                      Future.microtask(() => 
                                        //Navigator.of(context, rootNavigator: true).pushReplacementNamed(PrincipalScreen.routerName,arguments: loginForm.ObjRspUsuario)

                                        Navigator.of(context, rootNavigator: true).pushReplacement(
                                          CupertinoPageRoute<bool>(
                                            fullscreenDialog: true,
                                            builder: (BuildContext context) => PrincipalScreen(ObjUser: loginForm.ObjRspUsuario!,),
                                          ),
                                        )

                                      );
                                      
                                      
                                    }
                                    
                                  }
                                    FocusScope.of(context).unfocus();//para cerrar teclado del celular
                        
                                  },
                            
                            ),
                         ),


                     //const SizedBox(height: 15,),
                      

                      //SizedBox(height: 40, width: 20,),

                      Expanded(child: Row()),

                      Expanded(child: Row()),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const SizedBox(width: 20,),

                            const SizedBox(width: 25,),
                                
                            GestureDetector(
                              /*
                                          onTap: (){
                                            tipoIdentificacion.CedulaSelect = 'assets/BtnCedula_Gris.png';
                                            tipoIdentificacion.PasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
                                            tipoIdentificacion.IsPasaporte = false;
                                          },
                                          */
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
                        
                            const SizedBox(width: 20,),
                          ],
                        ),

                      Expanded(child: Row()),

                      //const SizedBox(height: 5,),
                    ],
                  ),
       
      // ),

      //),
    );
  
  }
}

