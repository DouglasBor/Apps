/*
import 'dart:async';
import 'package:enroll_app/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaUbicacionRegistroScreen extends StatelessWidget {
  static const String routerName = 'registroubicacion';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: '',
      home: Center(child: MapSample()),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){
              //Navigator.of(context, rootNavigator: true).pop(context);
              Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => FrmDatosPersonalesScreen()));
              //Pages[0];
            }, 
          ),
        ),
      
      body: GoogleMap(
        //myLocationEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      

    );
  }

/*
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  */
}

*/

import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/widgets/Mapa/manual_marker.dart';
import 'package:enroll_app/widgets/Mapa/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:enroll_app/bloc/index.dart';
import 'package:enroll_app/views/index.dart';

import 'package:enroll_app/widgets/index.dart';

class MapScreen extends StatefulWidget {
  ProspectoType? Obj_Prosp;
  ProspectoType? _Obj_Prospec_;

  MapScreen({Key? key,Obj_Prosp}) : super(key: key){
    _Obj_Prospec_ = Obj_Prosp;
  }

  @override
  State<MapScreen> createState() => _MapScreenState(Obj_Prospe: _Obj_Prospec_);
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  ProspectoType? Obj_Prospe;
  ProspectoType? Obj_Prospe_;

  _MapScreenState({Obj_Prospe}){
    Obj_Prospe_ = Obj_Prospe;
  }
  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {

          if (locationState.lastKnownLocation == null) {
            return const Center(child: Text('Espere por favor...'));
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {

              Map<String, Polyline> polylines = Map.from( mapState.polylines );
              if ( !mapState.showMyRoute ) {
                polylines.removeWhere((key, value) => key == 'myRoute');
              }

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: locationState.lastKnownLocation!,
                      polylines: polylines.values.toSet(), 
                      markers: mapState.markers.values.toSet(),
                    ),

                    const SearchBar(),
                    const ManualMarker(),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          BtnToggleUserRoute(),
          BtnFollowUser(),
          BtnCurrentLocation(),
        ],
      ),
    );
  }
*/
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {

          if (locationState.lastKnownLocation == null) {
            return const Center(child: Text('Espere por favor...'));
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {

              Map<String, Polyline> polylines = Map.from( mapState.polylines );
              if ( !mapState.showMyRoute ) {
                polylines.removeWhere((key, value) => key == 'myRoute');
              }

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    MapView(
                      initialLocation: locationState.lastKnownLocation!,
                      polylines: polylines.values.toSet(), 
                      markers: mapState.markers.values.toSet(),
                    ),
                    
                    //const SearchBar(), //Para cuando se quiera hacer uso del mapa como en uber
                    ManualMarker(Obj_Prosp: Obj_Prospe_),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          /*
          BtnToggleUserRoute(),
          BtnFollowUser(),
          */
          //SizedBox(height: 50,),
          BtnCurrentLocation(),
        ],
      ),
    );
  }


}
