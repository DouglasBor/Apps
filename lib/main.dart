
import 'package:enroll_app/bloc/index.dart';
import 'package:enroll_app/enroll_app.dart';
import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //await Cliente.init();
  runApp( 
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc() ),
        BlocProvider(create: (context) => LocationBloc() ),
        BlocProvider(create: (context) => MapBloc( locationBloc: BlocProvider.of<LocationBloc>(context) ) ),
        BlocProvider(create: (context) => SearchBloc( trafficService: TrafficService() )),        
      ],
      child: EnRollApp(),
    )
  );
}

