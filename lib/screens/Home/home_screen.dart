import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/Menu/Menu_Circular/circular_button.dart';
import 'package:enroll_app/widgets/Menu/TabBar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:enroll_app/widgets/index.dart';


class HomeScreen extends StatelessWidget{
  static const String routerName = 'home';


    @override
    Widget build(BuildContext context) {
    return Column(
              children: [
                Carusel(),
                Row(
                children: [
                  const SizedBox(width: 17,),
                  const Text('Favoritos', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.star_border,size: 30,),
                    tooltip: '',
                    onPressed: (){},
                  ),
                ],
              ),
              MenuFavoritos(),
              //MenuTramitesSolicitados(),
            ],
          );
    }
}
