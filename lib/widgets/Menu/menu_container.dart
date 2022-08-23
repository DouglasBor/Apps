

/////////////////

import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  static const String routerName = 'homeMenu';
  bool esHome = true;
  bool esFinanza = true;

  MenuContainer(bool EsHome, bool EsFinanza){
    esHome = EsHome;
    esFinanza = EsFinanza;
  }

  @override
    Widget build(BuildContext context) {
    return Column(
          
          children: [

            if(esHome) 
              HomeMenu(),

        ],
        );
    }
}
