import 'package:enroll_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:enroll_app/bloc/index.dart';
import 'package:enroll_app/screens/index.dart';

class LoadingScreen extends StatelessWidget {
  ProspectoType? Obj_Prospect;
  ProspectoType? Obj_Prospect_;

  LoadingScreen({Key? key,Obj_Prospect}) : super(key: key){
    Obj_Prospect_ = Obj_Prospect;
  }
   
   @override
   Widget build(BuildContext context) {
   return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          print('Estado $state');
          return //MapScreen();
          
          state.isAllGranted
          //state.isScreenInitial
            ? MapScreen(Obj_Prosp: Obj_Prospect_,)
            : const GpsAccessScreen();
            
        },
      )
   );
   }
}