import 'dart:ffi';

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {

  final double? width;
  final double? height;
  final Color? color;
  final Icon? icon;
  final VoidCallback? onClic = Test();

  CircularButton({Key? key, this.width, this.height, this.color, this.icon, onClic}) : super(key: key);
  //onClic = (){};
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon!, enableFeedback: true, onPressed: onClic,),
    );
  }
}

Test(){

}