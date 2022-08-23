import 'package:enroll_app/models/index.dart';
import 'package:enroll_app/widgets/index.dart';

class PersonalScreen extends StatelessWidget{
  static const String routerName = 'personal';

  UsuarioType? ObjUser;
  UsuarioType? Obj_User;

  PersonalScreen({ObjUser}){
    Obj_User = ObjUser;
  }


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
              MenuPersonal(ObjUser: Obj_User,),
              MenuPersonal2(),
              const SizedBox(height: 10,),
            ],
          );
    }

}
