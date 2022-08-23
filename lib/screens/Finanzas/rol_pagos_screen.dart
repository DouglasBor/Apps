import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/Finanzas/pdf_preview_screen.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:intl/date_symbol_data_local.dart'; // for other locales

UsuarioType? Obj_UserGeneralRol;
String FechaCorteDefaul = '';//"2022-07"

class RolPagosScreen extends StatefulWidget{
  static const String routerName = 'rolpagos';
  
  
  UsuarioType? ObjUser;
  UsuarioType? Obj_User;

  RolPagosScreen({ObjUser}){
    Obj_User = ObjUser;
    Obj_UserGeneralRol = ObjUser;
  }

  @override
  _FrmRolPagosScreen createState() => _FrmRolPagosScreen();

  
}

class _FrmRolPagosScreen extends State<RolPagosScreen> {
  bool MesAnterior = true;
  bool MeseseAnteriores = false;
  bool SwitchActivo = false;
  bool CargandoReporte = false;
  bool MuestraAnioCompleto = false;
  int mesesMostrar = 0;

  @override
  Widget build(BuildContext context){
    print('Fecha de ingreso ${Obj_UserGeneralRol!.fechaIngreso}');
    initializeDateFormatting('es'); 
    final Fecha_Ingreso = DateTime.parse(Obj_UserGeneralRol!.fechaIngreso);
    print('Mes y año Fecha de ingreso $Fecha_Ingreso');
    final FechaIngreso = DateFormat.yMMMMd('es').format(Fecha_Ingreso);

    final sizeScreen = MediaQuery.of(context).size;

    if(Fecha_Ingreso.year < DateTime.now().year ) {
      MuestraAnioCompleto = true;
    }
    else {
      MuestraAnioCompleto = false;
      mesesMostrar = DateTime.now().month - Fecha_Ingreso.month;
    }

    return SafeArea(
      child: 
        Scaffold(
          //backgroundColor: Colors.red,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Image(image: AssetImage('assets/LogoBlanco.png'),width: 220,),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.white,
            hoverColor: Colors.grey[400],
            onPressed: () {
              Navigator.of(context).pop();
                                                //Navigator.pushReplacementNamed(context, 'splash3');
                                                //Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3()),);
            },
          ),
        
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                  //Text('    ¿Quieres obtener tu rol de pagos?', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange[700])),
                  const SizedBox(width: 1,),
                  Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width - 100,
                            child: AutoSizeText(
                              '¿Quieres obtener tu rol de pagos?',
                              style: TextStyle(fontSize: 22, color: Colors.orange[700],fontWeight: FontWeight.bold,),
                              maxLines: 3,
                              minFontSize: 10,
                              presetFontSizes: const [22, 20, 18, 16, 14],
                            ),
                          ),
                  const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
              ],),

              const SizedBox(height: 25,),

              CardContainer(
                color: const Color.fromRGBO(253, 213, 190, 0.54),
                  child: Positioned(
                    bottom: 70,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify),
                                
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${Obj_UserGeneralRol!.nombres} ', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify),
                                    Text('${Obj_UserGeneralRol!.apellidos} ', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify),
                                  ],
                                ),
                                /*
                                AutoSizeText(
                                        '${Obj_UserGeneralRol!.nombres} ${Obj_UserGeneralRol!.apellidos}',
                                        style: const TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold,),
                                        minFontSize: 5,
                                        stepGranularity: 5,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        presetFontSizes: [22, 20, 18, 16, 14, 12],
                                  ),
                                  */
                                
                                const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify),
                              ],
                            ),
                          ),
                          const SizedBox(height: 17,),
                          Row(children: [Text('C.I: ${Obj_UserGeneralRol!.identificacion}', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black38), textAlign: TextAlign.justify)]),
                          
                          Container(height: 4,),
                          Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width - 100,
                            child: AutoSizeText(
                              '${Obj_User_General!.cargo} ',
                              style: const TextStyle(fontSize: 13, color: Colors.black,fontWeight: FontWeight.bold,),
                              maxLines: 3,
                              minFontSize: 10,
                              presetFontSizes: const [13, 11, 9],
                            ),
                          ),
                          Container(height: 4,),
                          Row(children: [Text('${Obj_UserGeneralRol!.area} ', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black38), textAlign: TextAlign.justify)]),
                          Container(height: 4,),
                          Row(children: [Text('${Obj_UserGeneralRol!.empresa} ', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.justify)]),
                          Container(height: 4,),
                          Row(children: [Text('Ingresó el $FechaIngreso ', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black38), textAlign: TextAlign.justify)]),
                      ],),
                    ),
                  )
              ),
              
              const SizedBox(height: 17,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                        Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                splashRadius: 10,
                                tristate: false,
                                value: MesAnterior, 
                                activeColor: Colors.black,
                                          onChanged: (value) {
                                            setState(() {
                                              MesAnterior = value!;
                                              MeseseAnteriores = false;
                                              if(!value){
                                                MeseseAnteriores = true;
                                              }
                                            });
                                          },
                                        ),
                                    //const Text('Del mes anterior', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                    Container(
                                      color: Colors.transparent,
                                      //width: MediaQuery.of(context).size.width,
                                      child: const AutoSizeText(
                                        'Del mes anterior',
                                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold,),
                                        maxLines: 3,
                                        minFontSize: 10,
                                        presetFontSizes: [15, 13, 11, 9, 7],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              
                              Container(
                                    color: Colors.transparent,
                                    //width: 20,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                          splashRadius: 10,
                                          activeColor: Colors.black,
                                          tristate: false,
                                          value: MeseseAnteriores, 
                                          onChanged: (value) {
                                            setState(() {
                                              MeseseAnteriores = value!;
                                              MesAnterior = false;
                                              if(!value){
                                                MesAnterior = true;
                                              }
                                            });
                                          },
                                        ),
                                        //const Text('De meses anteriores', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                        Container(
                                      color: Colors.transparent,
                                      //width: MediaQuery.of(context).size.width,
                                      child: const AutoSizeText(
                                        'De meses anteriores',
                                        style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold,),
                                        maxLines: 3,
                                        minFontSize: 10,
                                        presetFontSizes: [15, 13, 11, 9, 7],
                                      ),
                                    ),
                                      ],
                                    ),
                                  ),
                                  
                                const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                              ],
                            ),
                  
                ),
              ),

              const SizedBox(height: 17,),

              if(MesAnterior)
                Container(
                  color: Colors.transparent,
                  height: 140,
                  //height: 185,//En caso de pedir alguna descripción, quitar el comentario de esta línea
                  //width: 300,
                  child: MesesCortes(1,mesesMostrar,false)
                ),

              if(MeseseAnteriores)
                Container(
                  color: Colors.transparent,
                  //height: 185,//En caso de pedir alguna descripción, quitar el comentario de esta línea
                  height: 140,
                  //width: 500,
                  child: MesesCortes(12,mesesMostrar,MuestraAnioCompleto)
                ),
                

              //const SizedBox(height: 20,),
              //const SizedBox(height: 5,),
              
              CardContainer(
                color: const Color.fromRGBO(253, 213, 190, 0.54),
                child: Positioned(
                  bottom: 70,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.transparent,
                                //width: 260,//MediaQuery.of(context).size.width - 160,
                                width: MediaQuery.of(context).size.width - 130,
                                child: 
                                  SwitchActivo ?
                                    TextFormField(
                                      initialValue: Obj_UserGeneralRol!.correo,
                                      onChanged: (value) => Obj_UserGeneralRol!.correo = value,
                                      //enabled: SwitchActivo,
                                      keyboardType: TextInputType.emailAddress,//tipo de imput -> correo
                                      style: const TextStyle(color: Colors.black),
                                      decoration: InputDecorations.authInputDecoration(
                                            colorPrefixIcon: Colors.black,
                                            prefxIcon: Icons.email_outlined,
                                            colorTexto: Colors.black,
                                            TamanioIcono: 20,
                                            colorBordes: Colors.white,//Color.fromRGBO(253, 213, 190, 0.54),
                                            EsContrasenia: false,
                                            hintText: '',
                                            labelText: '',
                                            OnPress: (){}
                                          ),
                                      validator: (value) {
                                            String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                            RegExp regExp  = RegExp(pattern);
                                            return regExp.hasMatch(value ?? '') ? null : 'Correo invalido'; 
                                          },
                                      )
                                    :
                                    Row(
                                      children: [
                                        Container(
                                          
                                          color: Colors.transparent,
                                          height: 100,
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
                                                                            onPressed: ()  {
                                                                              
                                                                            },
                                                                            
                                                                            child: Row(
                                                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                //const Text('',style: TextStyle(color: Colors.black),),
                                                                                const Icon(Icons.email_outlined,color: Colors.black,size: 30,),
                                                                                const SizedBox(width: 5,),
                                                                                //Text(Obj_UserGeneralRol!.correo,style: const TextStyle(color: Colors.grey, fontSize: 15),),
                                                                                Column(
                                                                                  children: [
                                                                                    Container(
                                                                                      color: Colors.transparent,
                                                                                      width: MediaQuery.of(context).size.width - 250,
                                                                                      height: 40,
                                                                                  child: AutoSizeText(
                                                                                            '${Obj_UserGeneralRol!.correo} ',
                                                                                            style: const TextStyle(fontSize: 25, color: Colors.black38,fontWeight: FontWeight.bold,),
                                                                                            maxLines: 3,
                                                                                            minFontSize: 10,
                                                                                  ),
                                                                                ),
                                                                                  ],
                                                                                ),
                                                                                ],
                                                                              ),
                                                                          ),
 
                                                                      ),
                                                                        
                                                                    ),
                                                                  ],
                                                                  
                                                                ),
      
                              ),
                              Container(
                          width: 10,//MediaQuery.of(context).size.width - 500,
                          child: Switch(
                            
                                  activeColor: Colors.green,
                                  inactiveTrackColor: Colors.black,
                                  value: SwitchActivo, 
                                  onChanged: (bool value) 
                                  {
                                    setState(() {
                                      SwitchActivo = value;
                                    });
                                  }
                                ),
                        ),
                          ]),
                      ],),
                    ),
                  )
              ),

              const SizedBox(height: 20,),

              Container(
                width: MediaQuery.of(context).size.width - 170,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  
                  onTap: () async {
                      setState(() {
                        CargandoReporte = true;
                      });
                      
                      var invoice = ClienteType(
                        identificacion: Obj_UserGeneralRol!.identificacion,
                      );

                      int Anio_Actual = DateTime.now().year;
                      int Mes_Anterior = DateTime.now().month - 1;
                      String periodoEscogido = '';
                      

                      await Future.delayed(const Duration(seconds: 15));

                      setState(() {
                        CargandoReporte = false;
                      });

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      final mesEscogido = await prefs.getString("mesEscogido");
                      String CorreoEnviar = Obj_UserGeneralRol!.correo;

                      if(!SwitchActivo) {
                        CorreoEnviar = '';
                      }

                      if(MesAnterior) {
                        int Mes_Penultimo = DateTime.now().month - 2;
                        FechaCorteDefaul = '$Anio_Actual-$Mes_Anterior';

                        String MesString = '';
                        String AnioString = '';
                        String MesPenString = '';
                        

                        if(Mes_Anterior < 10) {
                          MesString = '0$Mes_Anterior';
                        }
                        else {
                          MesString = '$Mes_Anterior';
                        }

                        if(Mes_Penultimo < 10) {
                          MesPenString = '0$Mes_Penultimo';
                        } else {
                          MesPenString = '$Mes_Penultimo';
                        }

                        periodoEscogido = 'Corte del 23/$MesPenString/$Anio_Actual al 22/$MesString/$Anio_Actual';
                      } else {
                        FechaCorteDefaul = mesEscogido!;
                        periodoEscogido = await prefs.getString("periodoEscogido").toString();
                      }

                      print('Parámetros a enviar: $FechaCorteDefaul  // $periodoEscogido');
                      print('Envía correo: $CorreoEnviar');

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfScreenPage(invoice, 'Tu rol de pagos',FechaCorteDefaul,periodoEscogido,CorreoEnviar,false),
                        ),
                      );
                      
                    },
                  child: 
                  CargandoReporte ?
                  SpinKitFadingCircle(
                    size: 30,
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: index.isEven ? Colors.black12 : Colors.white,
                                      ),
                                    );
                                  },)
                  :
                  const FadeInImage(
                    width: 10,
                    height: 8,
                    placeholder: AssetImage('assets/no-image.jpg'), 
                    image: AssetImage('assets/IcRptRolPagos.png'),
                    ),
                  
                  ),
              ),
             
              const SizedBox(height: 15,),
          ],),
        ),
    
      ),
    );
  }
}

