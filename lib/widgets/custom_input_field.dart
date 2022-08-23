import 'package:enroll_app/ui/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomInputField extends StatelessWidget{
  bool esCalendario = false;
  double TamanioIcono = 0;
  VoidCallback? OnPress;
  String FechaNacimiento = '';

  CustomInputField ({required esCalendario, required TamanioIcono, required OnPress, Key? key}) : super (key: key);
  
  @override
  Widget build (BuildContext context){
    return TextFormField(
      autofocus: false,
      //initialValue: '',
      style: const TextStyle(color: Colors.white),
      //textCapitalization: TextCapitalization.words,
      onTap: ()async {
        print(esCalendario);
        if(!esCalendario){
          
          //OnPress;
          
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
          
        }
      },
      validator: (value){
          value = FechaNacimiento;
      },
      enabled: !esCalendario,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecorations.authInputDecoration(
        EsContrasenia: false,
        colorBordes: Colors.white,
        TamanioIcono: 35,
                hintText: '',
                labelText: '',
                sufixIcon: Icons.calendar_month_outlined,
                OnPress: (){}
              ),
              /*
      decoration: const InputDecoration(
        hintText: '',
        labelText: '',
        suffixIcon: Icon(Icons.calendar_month_outlined,),
        //icon: Icon(Icons.assignment_ind_outlined),
      ),
      */
    );
  
  }
}