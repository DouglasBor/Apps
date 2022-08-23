import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //AnimationController _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    List<ImagenesMemoria> Imagenes = [
      ImagenesMemoria(Index: 0, RutaMemoria: 'assets/IcMesa.png'),
      ImagenesMemoria(Index: 2, RutaMemoria: 'assets/IcGracias.png'),
      ImagenesMemoria(Index: 1, RutaMemoria: 'assets/IcGrupoColaboradores.png'),
    ];

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: size.height * 0.31,  
          
      child: Swiper(
        /*
        pagination: SwiperPagination(),
        control: SwiperControl(),
        */
        //pagination: SwiperPagination(alignment: Alignment.center),
        loop: true,
        itemCount: Imagenes.length,
        layout: SwiperLayout.STACK,
        autoplay: true,
        index: 0,
        fade: 3,
        autoplayDelay: 5000,
        //allowImplicitScrolling: true,
        //curve: Curves.easeInCirc,
        //indicatorLayout: PageIndicatorLayout.NONE,
        //autoplayDisableOnInteraction: true,
        duration: 10000, 
        viewportFraction: 0.8,       
        scale: 0.9,
        outer: false,
        itemWidth: size.width * 0.9,
        itemHeight: size.height * 0.26,
        itemBuilder: (_, int index){
          final ListaImagenesMemoria = Imagenes[index];

          return GestureDetector(
            onTap: () => null,//Navigator.pushNamed(context, DetailsScreen.routerName, arguments: 'movie-instance'),
            child: ClipRRect(

              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: AssetImage(ListaImagenesMemoria.RutaMemoria!),
                //image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                //fadeInDuration: Duration(milliseconds: 500),
                //fadeInCurve: Curve(),                
              ),
            ),
          );
        },
        customLayoutOption: CustomLayoutOption(startIndex: 0, stateCount: 3)
        
        /*
        .addRotate([-45.0/180,0.0,45.0/180]).addTranslate([
          Offset(-370.0, -40.0),
          Offset(0.0, 0.0),
          Offset(370.0, -40.0)
        ]),
        */  
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