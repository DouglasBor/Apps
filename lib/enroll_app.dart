import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/services/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



class EnRollApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
    SystemChrome.setPreferredOrientations([ DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, ]);
    ProspectoType ObjProsp;




    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => ProspectoTypeService('',''),
          lazy: false,
        ),
        /*
        ChangeNotifierProvider(
          create: ( _ ) => Cliente(correo: '',direccion: '',fechaNacimiento: DateTime.now(), genero: '',identificacion: '',latitud: 0,longitud: 0),
          lazy: false,
        ),
        */
      ], 
      child:
    
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          initialRoute: SplashScreen.routerName,
          routes: {
            AutenticacionErrorScreen.routerName: (_) => AutenticacionErrorScreen('',''),
            AuthenticationScreen.routerName: (_) => AuthenticationScreen(),
            AvisoEntradaScreen.routerName: (_) => AvisoEntradaScreen(),
            BienvenidoLastScreen.routerName: (_) => BienvenidoLastScreen(null),
            BuscaCorreoScreen.routerName: (_) => BuscaCorreoScreen(null),
            CertificadoLaboralScreen.routerName: (_) => CertificadoLaboralScreen(),
            ContraseniaScreen.routerName: (_) => ContraseniaScreen(NumIdentificacion: ''),
            FinanzasMenu.routerName: (_) => FinanzasMenu(),
            FrmDatosPersonalesScreen.routerName: (_) => FrmDatosPersonalesScreen(Obj_Prosp: null),
            HomeMenu.routerName: (_) => HomeMenu(),
            HomeScreen.routerName: (_) => HomeScreen(),
            IdentificacionErrorScreen.routerName: (_) => IdentificacionErrorScreen(),
            MarcacionesScreen.routerName: (_) => MarcacionesScreen(),
            OtpErrorScreen.routerName: (_) => OtpErrorScreen(),
            OtpScreen.routerName: (_) => OtpScreen(null),
            PassWordScreen.routerName: (_) => PassWordScreen(Obj_Prosp: null),
            PerfilScreen.routerName: (_) => PerfilScreen(),
            PersonalScreen.routerName: (_) => PersonalScreen(),
            PrincipalScreen.routerName: (_) => PrincipalScreen(ObjUser: null),
            RolPagosScreen.routerName: (_) => RolPagosScreen(),
            SplashScreen.routerName: (_) => SplashScreen(),
            TipoIdentificacionScreen.routerName: (_) => TipoIdentificacionScreen(),
            GenialPrevioInicioScreen.routerName: (_) => GenialPrevioInicioScreen(null),
            //VerificationOtpScreen.routerName: (_) => VerificationOtpScreen(Obj_Prosp:null)
        },
      home: PrincipalScreen(ObjUser: null),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,//Colors.grey[300],
        appBarTheme: const AppBarTheme(
          color: Colors.black,//Colors.orange[300]
        ),
      ),
  )
    );
    
  
}
}
