
import 'package:card_swiper/card_swiper.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/Menu/Menu_Circular/circular_button.dart';
import 'package:flutter/material.dart';
/*
class MenuPago extends StatelessWidget {
  
  double SizeHeight = 0;
  AnimationController? _animationController;
  Animation? _animation;

  MenuPago({SizeHeight, _animationController, _animation});

  @override
  Widget build(BuildContext context) {

    double getRadianFromDegree(double degree){
    double unitRadian = 57.295779513;
    return degree/unitRadian;
  }

    return Container(
      width: double.infinity,
      height: SizeHeight * 0.31,      
      child: Stack(
         Transform.translate(
                    offset: Offset.fromDirection(getRadianFromDegree(270),_animation!.value *(-100)),
                    child: CircularButton(
                    color: Colors.blue,
                        width: 60,
                        height: 60,
                        icon: Icon(Icons.group, color: Colors.white),
                        onClic: (){
                          
                        },
                  ),
                ),
                Transform.translate(
                    offset: Offset.fromDirection(getRadianFromDegree(225), _animation!.value * (-100)),
                    child: CircularButton(
                    color: Colors.green,
                        width: 60,
                        height: 60,
                        icon: Icon(Icons.translate, color: Colors.white),
                        onClic: (){
                          
                        },
                  ),
              ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadianFromDegree(180), _animation!.value *(-100)),
                    child: CircularButton(
                      color: Colors.orange,
                          width: 60,
                          height: 60,
                          icon: Icon(Icons.person, color: Colors.white),
                          onClic: (){
                            print('Entra');
                          },
                    ),
                  ),
                  Container(
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  width: 60,
                  height: 60,
                  child: IconButton(icon: Icon(Icons.add, color: Colors.white), enableFeedback: true, 
                    onPressed: (){
                      print('Entra');
                      if(_animationController != null){
                            bool IsCompleted = _animationController!.isCompleted;
                            if(IsCompleted){
                            _animationController?.reverse();
                          }
                          else{
                            _animationController?.forward();
                          }
                          }
                    },)
                  ),
              
      ),
    );
  }
}

class ImagenesMemoria{
  final int? Index;
  final String? RutaMemoria;  

  ImagenesMemoria({
    @required this.Index,
    @required this.RutaMemoria
  });

}
*/