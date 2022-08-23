import 'package:enroll_app/screens/index.dart';
import 'package:enroll_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_menu/pie_menu.dart';

class MenuBajoButton{
  final Function? OnPressed;
  final IconData? Icon;
  final String? Imagen;
  final String? ToolTip;

  MenuBajoButton({
    @required this.OnPressed, 
    @required this.Icon,
    this.Imagen,
    @required this.ToolTip}
  );

}



class MenuBajo extends StatelessWidget {
  int? ItemSeleccionadoDesdeFuera;
  MenuBajo( int ItemSeleccionadoDesde_Fuera){
    ItemSeleccionadoDesdeFuera = ItemSeleccionadoDesde_Fuera;
    
   // print('Escogido - $ItemSeleccionadoDesdeFuera');
  }
  
  final List<MenuBajoButton> items = [
    MenuBajoButton(Icon: Icons.home, OnPressed: (){print('Icono Pie_Chart');},ToolTip: 'Inicio'),
    //MenuBajoButton(Imagen: 'assets/icMoney.png', OnPressed: (){print('Icono Pie_Search');}, ToolTip: 'Finanzas'),
    MenuBajoButton(Icon: Icons.home, OnPressed: (){print('Icono Pie_Chart');},ToolTip: 'Finanzas'),
    MenuBajoButton(Icon: Icons.timer_rounded, OnPressed: (){print('Icono Pie_Notificaciones');}, ToolTip: 'Tiempo'),
    MenuBajoButton(Icon: Icons.medication, OnPressed: (){print('Icono Pie_Notificaciones');}, ToolTip: 'Salud'),
    //MenuBajoButton(Icon: Icons.face, OnPressed: (){print('Icono Pie_Supervised_Circle');}, ToolTip: 'Perfil'),
    //MenuBajoButton(Icon: Icons.more_vert_outlined, OnPressed: (){print('Icono Pie_Supervised_Circle');})
    //MenuBajoButton(Icon: Icons.menu, OnPressed: (){print('Icono Pie_Supervised_Circle');})
  ];

  @override
  Widget build(BuildContext context) {
    return 
       ChangeNotifierProvider(
        create: (_) => MenuModel(),        
        child: _MenuBackGround(
          Child: Menu_Items(items,ItemSeleccionadoDesdeFuera!),
        ),
      );
  }
}

class Menu_Items extends StatelessWidget {
  
  final List<MenuBajoButton> MenuItems;
  int? ItemSeleccionado_DesdeFuera;

  Menu_Items(this.MenuItems,int ItemSeleccionado_Desde_Fuera){
    ItemSeleccionado_DesdeFuera = ItemSeleccionado_Desde_Fuera;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(MenuItems.length, (i) => _MenuBajoButton(i,MenuItems[i],ItemSeleccionado_DesdeFuera!),)
      //children: List.generate(MenuItems.length, (i) => _MenuBajoButton(ItemSeleccionado_DesdeFuera!,MenuItems[i],ItemSeleccionado_DesdeFuera!),)
    );
  }
}

class _MenuBajoButton extends StatelessWidget {

  final int Index;
  final MenuBajoButton Item;
  int? Item_SeleccionadoDesdeFuera;

  _MenuBajoButton(this.Index, this.Item, int SelectOpcion){
    Item_SeleccionadoDesdeFuera = SelectOpcion;
  }

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<MenuModel>(context).itemSeleccionado;
   IconData IconoSeleccionado = Icons.home;
   print('Seleccionado desde fuera -- $Item_SeleccionadoDesdeFuera');
   print('Seleccionado -- $itemSeleccionado');

    switch(Item.ToolTip){
      case 'Inicio':
        IconoSeleccionado = Icons.home;
        break;
      case 'Finanzas':
        IconoSeleccionado = Icons.attach_money;
        break;
      case 'Tiempo':
        IconoSeleccionado = Icons.timer;
        break;
      case 'Salud':
        IconoSeleccionado = Icons.medication;
        break;
        /*
      case 'Perfil':
        IconoSeleccionado = Icons.face;
        break;
        */
      default:
        IconoSeleccionado = Icons.home;
        break;
    }

    return GestureDetector(
      onTap: (){
        Provider.of<MenuModel>(context, listen: false).itemSeleccionado = Index;
        if(Index == 0){
          //MaterialPageRoute(builder: (context) => HomeScreen(true,false));
          //Navigator.pushReplacementNamed(context, HomeScreen.routerName);
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()),);
        }
        if(Index == 1){
          Provider.of<MenuModel>(context, listen: false).itemSeleccionado = 1;
          //MaterialPageRoute(builder: (context) => FinanzasMenu());
          //Navigator.pushReplacementNamed(context, FinanzasMenu.routerName);
          //Navigator.pushNamed(context, FinanzasMenu.routerName, arguments: 'movie-instance');
          Navigator.push(context, MaterialPageRoute(builder: (_) => FinanzasMenu()),);
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        /*
        child: IconButton(
          icon: Icon(
            IconoSeleccionado,
            color: (itemSeleccionado == Index) ? Colors.orange[700] : Colors.grey[350],
          ),
          onPressed: null,
          iconSize: (itemSeleccionado == Index) ? 35 : 30,
          tooltip: Item.ToolTip,
        ),
        */
        child: IconButton(
          icon: Icon(
            IconoSeleccionado,
            color: (Item_SeleccionadoDesdeFuera == Index) ? Colors.orange[700] : Colors.grey[350],
          ),
          onPressed: null,
          iconSize: (Item_SeleccionadoDesdeFuera == Index) ? 35 : 30,
          tooltip: Item.ToolTip,
        )
      )
    );
  }
}

class _MenuBackGround extends StatelessWidget{
  final Widget? Child;
  const _MenuBackGround({@required this.Child});

  @override
  Widget build(BuildContext context){
    return Container(
        child: Child,
        width: 370,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,//Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5
            )
          ],
        ),
      );
  }

}

class MenuModel with ChangeNotifier{
  int ItemSeleccionado = 0;
  int get itemSeleccionado => ItemSeleccionado;

  set itemSeleccionado (int index){
    ItemSeleccionado = index;
    notifyListeners();
  }

}
