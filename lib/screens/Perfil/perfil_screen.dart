import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/Menu/Menu_Circular/circular_button.dart';
import 'package:enroll_app/widgets/Menu/TabBar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:enroll_app/widgets/index.dart';


class PerfilScreen extends StatelessWidget{
  static const String routerName = 'perfil';


    @override
    Widget build(BuildContext context) {
    return Column(
              children: [
                Carusel(),
                Row(
                children: [
                  SizedBox(width: 17,),
                  Text('Favoritos', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(width: 15),
                  IconButton(
                    icon: Icon(Icons.settings_outlined),
                    tooltip: 'Configuración',
                    onPressed: (){},
                  ),
                ],
              ),
              MenuFavoritos(),
              
            ],
          );
    }
}
