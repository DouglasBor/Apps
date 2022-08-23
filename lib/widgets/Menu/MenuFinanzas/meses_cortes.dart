import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int MesRecorrer = 0;
int position = 0;

class MesesCortes extends StatelessWidget {
  int AnioMes = 12;
  int meses_Laborados = 0;
  bool anio_Completo = false;

  MesesCortes(int Anio_Mes, int mesesLaborados, bool AnioCompleto)
  {
    AnioMes = Anio_Mes;
    anio_Completo = AnioCompleto;
    meses_Laborados = mesesLaborados;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 135,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [         
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AnioMes > 1 && !anio_Completo ? meses_Laborados : AnioMes,
                itemBuilder: (_, int index) => _MesesCortesOptions(index),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MesesCortesOptions extends StatefulWidget {

  int _Index = 0;
  _MesesCortesOptions (int index){
    _Index = index;
  }

  @override
  _MesesCortesLst createState() => _MesesCortesLst(_Index);

}

class _MesesCortesLst extends State<_MesesCortesOptions> {
  int _Index = 0;
  
  _MesesCortesLst(int index){
    _Index = index;
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    int AnioActual = DateTime.now().year;
    int MesActual = DateTime.now().month;
    String Mes_Desc = '';
    String Desc_Corte = '';
    String Para_Envio = '';

    List<Calendar> LstCalendario = [];

    for(int i = 0; i<=12; i++){

      if(MesRecorrer > 0){
        MesRecorrer -= 1;
      }
      else{
        if(MesRecorrer <= 0 && LstCalendario.length > 0) {
          MesRecorrer = 12;
          AnioActual -= 1;
        }
        else{
          MesRecorrer = MesActual - 1;
        }
      }

      switch(MesRecorrer){
        case 1:
          Mes_Desc = 'ENE';
          Desc_Corte = 'Corte del 23/12/$AnioActual al 22/01/$AnioActual';
          Para_Envio = '$AnioActual-01';
          break;
        case 2:
          Mes_Desc = 'FEB';
          Desc_Corte = 'Corte del 23/01/$AnioActual al 22/02/$AnioActual';
          Para_Envio = '$AnioActual-02';
          break;
        case 3:
          Mes_Desc = 'MAR';
          Desc_Corte = 'Corte del 23/02/$AnioActual al 22/03/$AnioActual';
          Para_Envio = '$AnioActual-03';
          break;
        case 4:
          Mes_Desc = 'ABR';
          Desc_Corte = 'Corte del 23/03/$AnioActual al 22/04/$AnioActual';
          Para_Envio = '$AnioActual-04';
          break;
        case 5:
          Mes_Desc = 'MAY';
          Desc_Corte = 'Corte del 23/04/$AnioActual al 22/05/$AnioActual';
          Para_Envio = '$AnioActual-05';
          break;
        case 6:
          Mes_Desc = 'JUN';
          Desc_Corte = 'Corte del 23/05/$AnioActual al 22/06/$AnioActual';
          Para_Envio = '$AnioActual-06';
          break;
        case 7:
          Mes_Desc = 'JUL';
          Desc_Corte = 'Corte del 23/06/$AnioActual al 22/07/$AnioActual';
          Para_Envio = '$AnioActual-07';
          break;
        case 8:
          Mes_Desc = 'AGO';
          Desc_Corte = 'Corte del 23/07/$AnioActual al 22/08/$AnioActual';
          Para_Envio = '$AnioActual-08';
          break;
        case 9:
          Mes_Desc = 'SEP';
          Desc_Corte = 'Corte del 23/08/$AnioActual al 22/09/$AnioActual';
          Para_Envio = '$AnioActual-09';
          break;
        case 10:
          Mes_Desc = 'OCT';
          Desc_Corte = 'Corte del 23/09/$AnioActual al 22/10/$AnioActual';
          Para_Envio = '$AnioActual-10';
          break;
        case 11:
          Mes_Desc = 'NOV';
          Desc_Corte = 'Corte del 23/10/$AnioActual al 22/11/$AnioActual';
          Para_Envio = '$AnioActual-11';
          break;
        case 12:
          Mes_Desc = 'DIC';
          Desc_Corte = 'Corte del 23/11/$AnioActual al 22/12/$AnioActual';
          Para_Envio = '$AnioActual-12';
          break;
        default:
          Mes_Desc = '';
          break;
      }
        if(Mes_Desc != ''){
          LstCalendario.add(
            Calendar(Anio: AnioActual, Mes: MesActual, MesDesc: Mes_Desc, DescCorte: Desc_Corte, ParaEnvio: Para_Envio),
          );
        }
      
    }
    final ListaCalendario = LstCalendario[_Index];
    
    return Container(
      color: Colors.transparent,
      width: 115,
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: 110,
            height: 111,
            child: GestureDetector(
                  onTap: () async {
                    setState(() { position = _Index; });
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('periodoEscogido', ListaCalendario.DescCorte);
                    await prefs.setString('mesEscogido', ListaCalendario.ParaEnvio);
                  },
                  child: Container(
                    child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                          Text(ListaCalendario.MesDesc, style: TextStyle( fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white), textAlign: TextAlign.center),
                                          Text(ListaCalendario.Anio.toString(), style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                                          Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                                        ],
                                      ),
                                    ),
                                  ],
                    ),
                    width: double.infinity,
                    height: 58,
                   
                    decoration: 
                      position == _Index ?
                      const BoxDecoration(
                        
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                        transform: GradientRotation(-360),
                        colors: <Color>[
                          Color.fromRGBO(36,36,36,1),
                          Color.fromRGBO(88, 89, 91, 1),
                          /*
                          Colors.black,
                          Colors.white
                        */
                          /*
                                    Color.fromRGBO(255,81,47,1),
                                    Color.fromRGBO(240, 152, 25, 1),
                                    */
                                    
                                  ]
                        ),
                        //color: Colors.black,//Color(0xFFF4F4F4),
                      //color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4,-4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(4,4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                        ],
                      
                      )
                      :
                      BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: const LinearGradient(
                        transform: GradientRotation(-360),
                        colors: <Color>[
                                    Color.fromRGBO(255,81,47,1),
                                    Color.fromRGBO(240, 152, 25, 1),
                                    
                                  ]
                        ),
                        shape: BoxShape.rectangle,
                      //color: Color(0xFFF4F4F4),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4,-4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(4,4),
                            blurRadius: 5,
                            spreadRadius: 2
                          ),
                        ],
                      )
                      

              ),
            ),
          ),
          
          const SizedBox(height: 5,),
         /* 
         const SizedBox(height: 15,),
          Container(
            //color: const Color.fromRGBO(253, 213, 190, 0.54),
            
            decoration: BoxDecoration(
              color: const Color.fromRGBO(253, 213, 190, 0.54),
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow> [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06), 
                                    offset: const Offset(4,6),
                                    blurRadius: 5
                                  ),]
            ),
            
            
            height: 70,
            width: 110,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AutoSizeText(
                           ListaCalendario.DescCorte,
                           style: const TextStyle(fontSize: 10, color: Colors.black),
                           maxLines: 6,
                    ),
              ),
              ), 
            ),
       */
        ]),
      );
  }

}