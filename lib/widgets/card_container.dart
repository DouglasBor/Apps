import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  
  final Widget child;
  final Color color;
  //List<Color>? LstColor;

  CardContainer({
    Key? key,
    required this.child,
    required this.color,
    //this.LstColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _createCardShape(),
        child: child
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    
   /*
      gradient:  LstColor != null ? 
      LinearGradient(
        transform: const GradientRotation(-360),
        colors: LstColor!
      )
      :
      LinearGradient(
        transform: const GradientRotation(-360),
        colors: <Color>[
                color             
        ]
      ),
      */
    color: color,//Color.fromRGBO(253, 213, 190, 0.54),
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ],
  );
}