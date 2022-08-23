import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

bool  TiempoCaducado = false;

class SimpleDialogItem extends StatelessWidget {
  
  
  final IconData? icon;
  final Color? color;
  final String? text;
  final String? text2;
  final String? text3;
  final VoidCallback? onPressed;

  final ProspectoType? Obj_Prosp;

  const SimpleDialogItem({Key? key, this.icon, this.color, this.text, this.text2, this.text3, this.onPressed, this.Obj_Prosp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int Minutos = 0;

    bool Termino = false;
    
    return SimpleDialogOption(
      onPressed: onPressed,
      child: ChangeNotifierProvider(
                  create: (_) => OtpService(),
                  child: _ContenidoModal(text: text, text2: text2, text3: text3, Obj_Prosp:Obj_Prosp),
                              
          ),
    );
  }
}


class _ContenidoModal extends StatelessWidget {

    final String? text;
    final String? text2;
    final String? text3;
    final ProspectoType? Obj_Prosp;

    _ContenidoModal({this.text, this.text2, this.text3,this.Obj_Prosp});


  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 290,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5.0),
                  child: Text(text!, style: const TextStyle(fontSize: 15)),
                ),
              ]),
    
    
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(text2!, style: const TextStyle(fontSize: 15),),
              ]
            ),
            
            const SizedBox(height: 22,),
    
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                child:
                      OtpForm(Obj_Prosp),
                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: TextFormField(
                              
                              onChanged: (value) {
                                if(value.length == 1){
                                  //EsEnabled = true;
                                  otpService.Campo1 = value;
                                  //FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1){},
                              decoration: InputDecorationsOtp.authInputDecoration(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),//Theme.of(context).textTheme.headline6,
                              //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              
                            ),
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: TextFormField(
                              //enabled: EsEnabled,
                              //enableInteractiveSelection: EsEnabled,
                              onChanged: (value) {
                                if(value.length == 1){
                                  otpService.Campo2 = value;
                                  //FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1){},
                              decoration: InputDecorationsOtp.authInputDecoration(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),//Theme.of(context).textTheme.headline6,
                              //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              
                            ),
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if(value.length == 1){
                                  otpService.Campo3 = value;
                                  //FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1){},
                              decoration: InputDecorationsOtp.authInputDecoration(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              
                            ),
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if(value.length == 1){
                                  otpService.Campo4 = value;
                                  //FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1){},
                              decoration: InputDecorationsOtp.authInputDecoration(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              
                            ),
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if(value.length == 1){
                                  otpService.Campo5 = value;
                                  //FocusScope.of(context).nextFocus();
                                }
                              },
                              onSaved: (pin1){},
                              decoration: InputDecorationsOtp.authInputDecoration(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              
                            ),
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if(value.length == 1){
                                  otpService.Campo6 = value;
                                  otpService.isValidForm();
                                  if(otpService.isValidForm()){
                                    otpService.validaOtp(Obj_Prosp!.identificacion);
                                  }
                /*
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) => BienvenidoLastScreen(Obj_Prosp)),
                                  );
                                  */
                                }
                              },
                              onSaved: (pin1){},
                              decoration: InputDecorationsOtp.authInputDecoration(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              //style: TextStyle(backgroundColor: Colors.white),// Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              
                            ),
                          ),
                          //SizedBox(width: 5,),
                      ]),
                    */
 
              ),
            ),
            
            const SizedBox(height: 22,),
           
          ],
        ),
      
      );

  }
}
