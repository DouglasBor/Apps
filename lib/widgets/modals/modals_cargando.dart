import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class SimpleDialogCargando extends StatelessWidget {
  
  String MensajeMostrar = '';
  String MensajeMostrar_2 = '';
  String Mensaje_Mostrar = '';
  String Mensaje_Mostrar2 = '';

  SimpleDialogCargando({required MensajeMostrar, required MensajeMostrar_2}){
    Mensaje_Mostrar = MensajeMostrar;
    Mensaje_Mostrar2 = MensajeMostrar_2;
  }
  
  @override
  Widget build(BuildContext context) {
    int Minutos = 0;

    bool Termino = false;
    
    return SimpleDialogOption(
      onPressed: (){},
      child: Container(
        child: Column(
          children: [
            CircularProgressIndicator(
                              color: Colors.orange,
                            ),
            SizedBox(height: 20,),
            Text("Por favor espera", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),

                                Column(
                                  children: [
                                    Text(Mensaje_Mostrar),
                                    Text(Mensaje_Mostrar2),
                                  ],
                                ),
                             
                            
                            
                            
                            
              ],
        )
      ),
    );
  }
}

