import 'package:auto_size_text/auto_size_text.dart';
import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';

class MarcacionesScreen extends StatelessWidget{
  static const String routerName = 'marcaciones';

  @override
  Widget build(BuildContext context){
    return  SafeArea(
      child: 
        Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(image: AssetImage('assets/LogoBlanco.png'),width: 200,),//Text('¿Quieres marcar el inicio o Fin de tu jornada laboral?', style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange[700])),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.white,
            hoverColor: Colors.grey[400],
            onPressed: (){
                            Navigator.of(context).pop();
                                                //Navigator.pushReplacementNamed(context, 'splash3');
                                                //Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3()),);
                        },
            //onPressed: () => Navigator.pushNamed(context, HomeScreen.routerName, arguments: 'movie-instance'),

          ),
        
        ],
      ),
     
      //drawer: const SideMenu(),
      /*
      body: AuthBackgroundMarc(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image(image: AssetImage('assets/LogoRiasem.png'),width: 260,),
              ],),

              
              
              CardContainerMarc(
                  child: Positioned(
                    bottom: 70,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        
                        children: [
                          Text('Recuerda que...', style: TextStyle( fontSize: 26, fontWeight: FontWeight.bold, color: Colors.orange[600]), textAlign: TextAlign.left),
                          Text('Debes ecnontrarte', style: TextStyle( fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.left),
                          Text('Dentro del perímetro', style: TextStyle( fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.left),
                          Text('De la empresa para', style: TextStyle( fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.left),
                          Text('Poder marcar tu', style: TextStyle( fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.left),
                          Text('Entrada o salida', style: TextStyle( fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.left),
                      ],),
                    ),
                  )
              ),
              
              SizedBox(height: 50),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.center,),
                  SizedBox(width: 17,),
                  Text('¿Qué tipo de autenticación', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange[700])),
                  
              ],),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.center,),
                  SizedBox(width: 17,),
                  Text('biométrica usarás?', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange[700])),
              ],),
               
                
          ],),
        ),
      )
      */
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
                  const SizedBox(width: 2,),
                  Column(
                                                                                  children: [
                                                                                    Container(
                                                                                      color: Colors.transparent,
                                                                                      width: MediaQuery.of(context).size.width - 100,
                                                                                      height: 40,
                                                                                  child: AutoSizeText(
                                                                                            '  ¿Quieres marcar el inicio o Fin de tu jornada laboral?',
                                                                                            style: TextStyle(fontSize: 25, color: Colors.orange[700],fontWeight: FontWeight.bold,),
                                                                                            maxLines: 3,
                                                                                            minFontSize: 10,
                                                                                            //stepGranularity: 5.0,
                                                                                  ),
                                                                                ),
                                                                                  ],
                                                                                ),
                                                  
                  const Text('', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center),
              ],),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(image: AssetImage('assets/RecordatorioMarcacion.png'), width: 400,),
              ],),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.center,),
              
                  Text('¿Qué tipo de autenticación', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange[700])),
                  
              ],),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(alignment: Alignment.center,),
                  const SizedBox(width: 17,),
                  Text('biométrica usarás?', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange[700])),
                  
              ],),
              
              const SizedBox(width: 17,height: 40,),
               
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.center),
                  SizedBox(width: 4,),
                  MaterialButton(
                    onPressed: (){
                      //Navigator.pushReplacementNamed(context, MapasScreen.routerName);
                    },
                    child: Container(
                      child: Image(image: AssetImage('assets/IcHuella.png'), width: 80,),
                    ),
                  ),

                  //Image(image: AssetImage('assets/IcHuella.png'), width: 80,),
                  //SizedBox(width: 4,),
                  MaterialButton(
                    onPressed: (){},
                    child: Container(
                      child: Image(image: AssetImage('assets/IcFacial.png'), width: 80,),
                    ),
                  ),
                  //Image(image: AssetImage('assets/IcFacial.png'), width: 80,),
                  //SizedBox(width: 4,),
                  MaterialButton(
                    onPressed: (){},
                    child: Container(
                      child: Image(image: AssetImage('assets/IcVoz.png'), width: 80,),
                    ),
                  ),
                  //Image(image: AssetImage('assets/IcVoz.png'), width: 80,),
                ],),
               ),
          ],),
        ),
    
      ),
    );
  }
}