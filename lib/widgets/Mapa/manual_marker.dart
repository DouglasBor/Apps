import 'package:enroll_app/bloc/index.dart';
import 'package:enroll_app/helpers/show_loading_message.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManualMarker extends StatelessWidget {
  ProspectoType? Obj_Prosp;
  ProspectoType? Obj_Prospecto;
  ManualMarker({Key? key,  Obj_Prosp}) : super(key: key){
    var Nombre = Obj_Prosp!.nombres;
    print('Obj Prosp mapa-- $Nombre');
    Obj_Prospecto = Obj_Prosp;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return _ManualMarkerBody(ObjProsp: Obj_Prospecto);
        /* //Para cuando se quiera hacer uso del mapa como en uber
        return state.displayManualMarker 
            ? const _ManualMarkerBody()
            : const SizedBox();
            */

      },
    );
  }
}




class _ManualMarkerBody extends StatelessWidget {
  ProspectoType? ObjProsp;
  ProspectoType? Obj_Prospec;
  
  _ManualMarkerBody({Key? key,ObjProsp}) : super(key: key){
    Obj_Prospec = ObjProsp;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          
          Positioned(
            top: 70,
            left: 20,
            child: _BtnBack(Obj_Prospecto: ObjProsp)
          ),


          Center(
            child: Transform.translate(
              offset: const Offset(0, -22 ),
              child: BounceInDown(
                from: 100,
                child: Container(    
                  width: 65,
                  height: 65,
                  //color: Colors.transparent,
                  decoration: const BoxDecoration(
                    
                    image: DecorationImage(
                        image: AssetImage('assets/PinRegistro.png'), 
                        //fit: BoxFit.cover,
                    ),
                    
                   // color: Colors.black
                  ),
                  )//const Icon( Icons.location_on_rounded, size: 60 )
              ),
            ),
          ),

          // Boton de confirmar
          Positioned(
            bottom: 70,
            left: 40,
            child: FadeInUp(
              duration: const Duration( milliseconds: 300 ),
              child: MaterialButton(
                minWidth: size.width - 70,
                child: const Text('Confirma tu ubicación', style: TextStyle( color: Colors.white, fontSize: 15 )),
                color: Colors.orange[700],
                elevation: 0,
                height: 50,
                shape: const StadiumBorder(),
                onPressed: () async {
                
                  // Todo: loading

                  final start = locationBloc.state.lastKnownLocation;
                  if ( start == null ) return;

                  final end = mapBloc.mapCenter;
                  if ( end == null ) return;

                  //showLoadingMessage(context);
/*

                  final destination = await searchBloc.getCoorsStartToEnd(start, end);
                  
                  await mapBloc.drawRoutePolyline(destination);
                  
                  searchBloc.add( OnDeactivateManualMarkerEvent());
                  */
                  //print('Coordenadas: $end');
                  var loc = locationBloc.state;
                  //Navigator.pop(context);
                   final gpsBloc = BlocProvider.of<GpsBloc>(context);
                  gpsBloc.VuelvePantallaFrm();
                  searchBloc.add( OnDeactivateManualMarkerEvent());
                  Obj_Prospec!.latitud = end.latitude;
                  Obj_Prospec!.longitud = end.longitude;

                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Coordenadas: end,Obj_Prosp: Obj_Prospec,)),
                  );
                  
                },
              ),
            )
          ),

        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  ProspectoType? Obj_Prospecto;
  _BtnBack({
    Key? key,
    Obj_Prospecto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration( milliseconds: 300 ),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon( Icons.arrow_back_ios_new, color: Colors.black ),
          onPressed: () {
            /* //Para cuando se quiera hacer uso del mapa como en uber
            BlocProvider.of<SearchBloc>(context).add(
              OnDeactivateManualMarkerEvent()
            );
            */
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            
            gpsBloc.VuelvePantallaFrm();
            
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen(Obj_Prosp: Obj_Prospecto)),
            );
          },
        ),
      ),
    );
  }
}