
import 'package:carousel_slider/carousel_slider.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';

class Carusel extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final items = ["Android", "iOS", "Desktop", "Web"];
    List<ImagenesMemoria> LstImagenes = [
      ImagenesMemoria(Index: 0, RutaMemoria: 'assets/IcMesa.png'),
      ImagenesMemoria(Index: 1, RutaMemoria: 'assets/IcGracias.png'),
      ImagenesMemoria(Index: 2, RutaMemoria: 'assets/IcGrupoColaboradores.png'),
    ];


    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: size.height * 0.25,
          
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.8,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: LstImagenes.map(

              (item) => Center(
                child: Container(
                  color: Colors.red,
                  width: 650,
                  //height: 450,
                  child: Image.asset(
                    item.RutaMemoria!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
