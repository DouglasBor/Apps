import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/Finanzas/pdf_preview_screen.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'package:intl/date_symbol_data_local.dart'; // for other locales

UsuarioType? Obj_UserGeneral;

class CertificadoLaboralScreen extends StatefulWidget{
  static const String routerName = 'certificadolaboral';

  UsuarioType? ObjUser;
  UsuarioType? Obj_User;

  CertificadoLaboralScreen({ObjUser}){
    Obj_User = ObjUser;
    Obj_UserGeneral = ObjUser;
  }

  @override
  _CertificadoLaboralScreen createState() => _CertificadoLaboralScreen();
}

class _CertificadoLaboralScreen extends State<CertificadoLaboralScreen> {
  bool MesAnterior = true;
  bool MeseseAnteriores = false;
  bool SwitchActivo = false;
  bool CargandoReporte = false;
  bool SwitchActivoSueldo = false;

  
  @override
  Widget build(BuildContext context){
    final sizeScreen = MediaQuery.of(context).size;
    initializeDateFormatting('es'); 
    final Fecha_Ingreso = DateTime.parse(Obj_UserGeneral!.fechaIngreso);
    final FechaIngreso = DateFormat.yMMMMd('es').format(Fecha_Ingreso);
    String NombresCompletos = '${Obj_UserGeneral!.nombres} ${Obj_UserGeneral!.apellidos}';

    return SafeArea(
      child: 
        Scaffold(
          //backgroundColor: Colors.red,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(image: AssetImage('assets/LogoBlanco.png'),width: 220,),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
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
                  //Text('    ¿Necesitas tu Certificado Laboral?', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange[700])),
                  const SizedBox(width: 1,),
                  Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width - 100,
                            child: AutoSizeText(
                              '¿Necesitas tu Certificado Laboral?',
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
                                const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${Obj_UserGeneral!.nombres} ', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                    Text('${Obj_UserGeneral!.apellidos} ', style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                  ],
                                ),
                                  
                                const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                          const SizedBox(height: 17,),

                          Row(children: [Text('C.I: ${Obj_UserGeneral!.identificacion}', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black38), textAlign: TextAlign.left)]),
                          //Row(children: [Text('${Obj_UserGeneral!.cargo}', style: const TextStyle( fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.left)]),
                          Container(height: 4,),
                          
                          Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width - 100,
                            child: AutoSizeText(
                              '${Obj_UserGeneral!.cargo} ',
                              style: const TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold,),
                              maxLines: 3,
                              minFontSize: 10,
                              presetFontSizes: const [15, 13, 11, 9],
                            ),
                          ),
                          
                          Container(height: 4,),
                          Row(children: [Text('${Obj_UserGeneral!.area} ', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black38), textAlign: TextAlign.left)]),
                          Container(height: 4,),
                          Row(children: [Text('${Obj_UserGeneral!.empresa} ', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.left)]),
                          Container(height: 4,),
                          Row(children: [Text('Ingresó el $FechaIngreso', style: const TextStyle( fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black38), textAlign: TextAlign.left)]),
                      ],),
                    ),
                  )
              ),
              
              const SizedBox(height: 34,),

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
                              const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                              Text('${(Obj_UserGeneral!.sueldo).toStringAsFixed(2)} USD', style: const TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                              const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                            ],
                          ),
                          
                          const SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                              Text('Contrato: ${Obj_UserGeneral!.tipoContrato} ', style: const TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.left),
                              const Text('', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('  ', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                              Container(
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width - 230,
                                height: 40,
                                child: const Center(
                                  child: AutoSizeText(
                                                            'Mostrar sueldo en el certificado',
                                                            style: TextStyle(fontSize: 20, color: Colors.black38,fontWeight: FontWeight.bold,),
                                                            maxLines: 3,
                                                            minFontSize: 10,
                                                            presetFontSizes: [25, 22, 20, 18],
                                                          ),
                                                        ),
                                                      ),
                              Container(
                          width: 2,//MediaQuery.of(context).size.width - 500,
                          child: Switch(
                            
                                  activeColor: Colors.green,
                                  inactiveTrackColor: Colors.black,
                                  value: SwitchActivoSueldo, 
                                  onChanged: (bool value) 
                                  {
                                    setState(() {
                                      SwitchActivoSueldo = value;
                                    });
                                  }
                                ),
                        ),
                              const Text('  ', style: TextStyle( fontSize: 1, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                            ],
                          ),

                         
                      ],),
                    ),
                  )
              ),
              
              
              const SizedBox(height: 34,),
              
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
                                          child: Center(
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
                                                  children: [
                                                    const Icon(Icons.email_outlined,color: Colors.black,size: 30,),
                                                    const SizedBox(width: 5,),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          color: Colors.transparent,
                                                          width: MediaQuery.of(context).size.width - 230,
                                                          height: 40,
                                                          child: AutoSizeText(
                                                            '${Obj_UserGeneral!.correo} ',
                                                            style: const TextStyle(fontSize: 20, color: Colors.black38,fontWeight: FontWeight.bold,),
                                                            maxLines: 3,
                                                            minFontSize: 10,
                                                            presetFontSizes: const [25, 22, 20, 18],
                                                          ),
                                                        ),
                                                      ],
                                                    ),                            
                                                  ],
                                                ),
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

              const SizedBox(height: 45,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width - 170,//260,
                height: 40,
                child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        CargandoReporte = true;
                      });

                      String CorreoEnviar = Obj_UserGeneral!.correo;

                      if(!SwitchActivo) {
                        CorreoEnviar = '';
                      }

                      var invoice = ClienteType(
                        identificacion: Obj_UserGeneral!.identificacion,
                      );
                      
                      await Future.delayed(const Duration(seconds: 15));

                      setState(() {
                        CargandoReporte = false;
                      });

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfScreenPage(invoice,  'Tu Certificado Laboral',null,null,CorreoEnviar,SwitchActivoSueldo),
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
                  FadeInImage(
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

