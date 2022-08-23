import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class OtpForm extends StatefulWidget {
  String Nombre_Persona = '';
  String Cedula_Persona = '';
  bool EsEnabled = false;

  ProspectoType? Obj_Prosp;
  OtpForm(ProspectoType? ObjProsp){
    print('Num ident: ${ObjProsp!.identificacion} ');
    Obj_Prosp = ObjProsp;
  }

  @override
  _OtpForm createState() => _OtpForm(Obj_Prosp);

}

class _OtpForm extends State<OtpForm>
{
  ProspectoType? Obj_Prosp;
  bool EstaCaducado = false;

  _OtpForm(ProspectoType? ObjProsp){
    Obj_Prosp = ObjProsp;
    startTimer();
  }

  static const maxSeconds = 60;
  static const maxMinutes = 1;

  int seconds = maxSeconds;
  int Minutos = maxMinutes;
  String SegundosLetras = '00';

  Timer? timer;

  void startTimer(){
    seconds = 0;
    Minutos = 2;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) { 
      if(seconds > 0){
        setState(() {
          seconds--;
          if(seconds<10){
            SegundosLetras = '0'+seconds.toString();
          }
          else{
            SegundosLetras = seconds.toString();
          }
        });
      }
      else{
        if(seconds == 0 && Minutos > 0){
          Minutos--;
          seconds = maxSeconds;
        }
        if(seconds == 0 && Minutos == 0){
          stopTimer();
        }
        
      }
      
    });
  }

  void stopTimer(){
    
    setState(() {
          EstaCaducado = true;
        });
    timer?.cancel();
  }

  void resetTimer() => setState(() {
    seconds = maxSeconds;
  });

  @override
  Widget build(BuildContext context) {
    final otpService = Provider.of<OtpService>(context);

    return Form(
      
      key: otpService.FormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
                    
                    height: 45,
                    width: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        
                        initialValue: otpService.Campo1,
                        obscureText: false,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) {
                          if(value.length == 1){
                            otpService.Campo1 = value;
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1){},
                        decoration: InputDecorationsOtp.authInputDecoration(),
                        
                        style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        initialValue: otpService.Campo2,
                        obscureText: false,
                        onChanged: (value) {
                          if(value.length == 1){
                            otpService.Campo2 = value;
                            FocusScope.of(context).nextFocus();
                          }
                          else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        onSaved: (pin1){},
                        decoration: InputDecorationsOtp.authInputDecoration(),
                        style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        initialValue: otpService.Campo3,
                        obscureText: false,
                        onChanged: (value) {
                          if(value.length == 1){
                            otpService.Campo3 = value;
                            FocusScope.of(context).nextFocus();
                          }
                          else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        onSaved: (pin1){},
                        decoration: InputDecorationsOtp.authInputDecoration(),
                        style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                        //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        initialValue: otpService.Campo4,
                        obscureText: false,
                        onChanged: (value) {
                          if(value.length == 1) {
                            otpService.Campo4 = value;
                            FocusScope.of(context).nextFocus();
                          }
                          else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        onSaved: (pin1){},
                        decoration: InputDecorationsOtp.authInputDecoration(),
                        style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                        //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        initialValue: otpService.Campo5,
                        obscureText: false,
                        onChanged: (value) {
                          if(value.length == 1){
                            otpService.Campo5 = value;
                            FocusScope.of(context).nextFocus();
                          }
                          else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        onSaved: (pin1){},
                        decoration: InputDecorationsOtp.authInputDecoration(),
                        style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                        //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        initialValue: otpService.Campo6,
                        obscureText: false,
                        onChanged: (value) async {
                          if(value.length == 1){
                            otpService.Campo6 = value;
                            
                            showDialog(
                              context: context, 
                              barrierDismissible: false,
                              builder: (context) => 
                                SimpleDialog(
                                  alignment: Alignment.center,
                                  children: [
                                      SimpleDialogCargando(MensajeMostrar: 'estamos verificando',MensajeMostrar_2: 'tu código de seguridad',),
                                ]
                              ),
                            );

                            if(otpService.isValidForm()) {
                             await otpService.validaOtp(Obj_Prosp!.identificacion);
                             if(otpService.Obj_Rsp!.succeeded && otpService.Obj_Rsp!.statusCode == "000"){
                              Navigator.of(context, rootNavigator: true).pop();
                                Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(builder: (context) => BienvenidoLastScreen(Obj_Prosp)),
                                );
                              }
                              else {
                                Navigator.of(context, rootNavigator: true).pop();
                                print('Estado código otp: ${otpService.Obj_Rsp!.statusCode}');
                                if(!otpService.Obj_Rsp!.succeeded && otpService.Obj_Rsp!.statusCode == "001"){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) => OtpErrorScreen()),
                                  );
                                }
                                if(!otpService.Obj_Rsp!.succeeded && otpService.Obj_Rsp!.statusCode == "002"){
                                  CustomBgAlertBox(
                                        context: context,
                                        title: '!UPS¡',
                                        infoMessage: 'OTP caducada',
                                        buttonColor: Colors.red,
                                        buttonText: 'Cerrar',
                                        //icon: Icons.close_rounded,
                                        icon: Icons.cancel,
                                        titleTextColor: Colors.red[400],
                                    );
                                }
                              }
                            }
                          }
                          else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        onSaved: (pin1){},
                        decoration: InputDecorationsOtp.authInputDecoration(),
                        style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                        //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),

              ]
            ),
         

          !EstaCaducado ?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                  //Text(text3!, style: const TextStyle(fontSize: 15, color: Colors.black),),
              ]
            )
            :
            Container(),
            
            const SizedBox(height: 80,),
    
            !EstaCaducado 
            ?
            Column(
              children: [
                const Text('Tu código expira en 2 minutos',style: TextStyle(color: Colors.white, fontSize: 17),),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                        value: (seconds/maxSeconds)/2,//((seconds/2)/(maxSeconds/2))/0.5,
                        strokeWidth: 12,
                        backgroundColor: Colors.greenAccent,
                      ),
                      Center(
                        child: Text('$Minutos:$SegundosLetras',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[700],
                            fontSize: 20
                          ),
                        ),
                      ),
                    ]),
                ),
              ],
            )
            : 
            Column(
              children: [
                //const Text('¿No has recibido el código de verificación?',style: TextStyle(color: Colors.white, fontSize: 25),),
                Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width - 57,
                            child: const AutoSizeText(
                              '¿No has recibido el código de verificación?',
                              style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold,),
                              maxLines: 3,
                              minFontSize: 10,
                              presetFontSizes: [18, 16, 14, 12],
                            ),
                          ),
                MaterialButton(
                  child: Container(color: Colors.transparent, child: Text("Reenviar Sms",style: TextStyle(fontSize: 25.0, color: Colors.orange[700], decoration: TextDecoration.underline,))),
                  onPressed: (){
                    otpService.Campo1 = '';
                      otpService.Campo2 = '';
                      otpService.Campo3 = '';
                      otpService.Campo4 = '';
                      otpService.Campo5 = '';
                      otpService.Campo6 = '';
                      
                    setState(() {
                      otpService.reenviaOtp(Obj_Prosp!.identificacion,Obj_Prosp!.email,Obj_Prosp!.alias,Obj_Prosp!.celular);
                      EstaCaducado = false;
                      startTimer();
                    });
                  },                                  
                ),
              ],
            ),
    
            const SizedBox(height: 10,),
    
      ]),
    );
 
  }

}
