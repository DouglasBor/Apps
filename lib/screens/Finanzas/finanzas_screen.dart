import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/widgets/index.dart';



class FinanzasScreen extends StatelessWidget{

  UsuarioType? ObjUser;
  UsuarioType? Obj_User;

  FinanzasScreen({ObjUser}){
    Obj_User = ObjUser;
  }


  static const String routerName = 'finanzas';

    @override
    Widget build(BuildContext context) {
    return Column(
            children: [
              Carusel(),
              Row(
              children: [
                const SizedBox(width: 17,),
                const Text('Favoritos', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(width: 15),
                IconButton(
                  icon: const Icon(Icons.star_border,size: 30,),
                  tooltip: '',
                  onPressed: (){},
                ),
              ],
            ),

              MenuFavoritos(),
              MenuFinanzas(ObjUser: Obj_User),

              const SizedBox(height: 40),
        ],
        );
    }

}
