import 'package:enroll_app/widgets/Menu/Menu_Circular/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularMenuPage extends StatefulWidget {
  //const CircularMenuPage({Key? key}) : super(key: key);

  @override
  State<CircularMenuPage> createState() => _CircularMenuPageState();
}

class _CircularMenuPageState extends State<CircularMenuPage> {
  @override
  Widget build(BuildContext context) {
  Size Tamanio = MediaQuery.of(context).size;
  
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Tamanio.width,
          height: Tamanio.height,
          child: Stack(
            children: [
              Positioned(
                right: 20,
                bottom: 20,
                child: Stack(
                  children: [
                    CircularButton(
                      color: Colors.red,
                      width: 60,
                      height: 60,
                      icon: Icon(Icons.add, color: Colors.white),
                      onClic: (){
                        
                      },
                    ),
                  ]
                ),
              ),
            ]),
        ),
      ),      
    );
/*
    return Scaffold(
      body: Container(
        width: 5,//double.infinity,
        height: 4,//double.infinity,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    SvgPicture.asset('assets/BotonMenuGiratorio/BtnMenuGiratorio.svg'),
                    //Image(image: AssetImage('assets/BotonMenuGiratorio/BtnMenuGiratorio.svg'),)

                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  */
  }
}
