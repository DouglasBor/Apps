
import 'dart:isolate';

import 'package:flutter/material.dart';

class Tab_Bar_Menu extends StatefulWidget{

  final int VarIndex;
  final ValueChanged<int> OnChangeTab;

  const Tab_Bar_Menu
  ({
    required this.VarIndex,
    required this.OnChangeTab,
    Key? key,
  }) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();

}

class _TabBarState extends State<Tab_Bar_Menu>{

  @override
  Widget build(BuildContext context){
    final placeholder = Opacity(opacity: 0, child:IconButton(onPressed: null, icon: Icon(Icons.no_cell)));


    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.black,
      notchMargin: 5,
      child: Row(        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(Index: 0, IconVar: Icon(Icons.home), Tooltip: 'Inicio'),
          buildTabItem(Index: 1, IconVar: Icon(Icons.money), Tooltip: 'Finanzas'),
          placeholder,
          buildTabItem(Index: 2, IconVar: Icon(Icons.access_time_filled), Tooltip: 'Tiempo'),
          buildTabItem(Index: 3, IconVar: Icon(Icons.medication), Tooltip: 'Salud'),          
        ],
      ),
      
    );

/*
return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.black,
      notchMargin: 5,
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(        
              
              children: [
                buildTabItem(Index: 0, IconVar: Icon(Icons.home), Tooltip: 'Inicio'),
                buildTabItem(Index: 1, IconVar: Icon(Icons.money), Tooltip: 'Finanzas'),
                placeholder,
                buildTabItem(Index: 2, IconVar: Icon(Icons.access_time_filled), Tooltip: 'Tiempo'),
                buildTabItem(Index: 3, IconVar: Icon(Icons.medication), Tooltip: 'Salud'),

                
              ],
            ),
            
            Row(
              children: [
                //Text('Inicio', style: TextStyle(color: Colors.white),)
            ],),
          ],
        
      ),
      
    );

*/

/*
    return Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                    
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                
                              buildTabItem(Index: 0, IconVar: Icon(Icons.home), Tooltip: 'Inicio'),
                              buildTabItem(Index: 1, IconVar: Icon(Icons.money), Tooltip: 'Finanzas'),
                              placeholder,
                              buildTabItem(Index: 2, IconVar: Icon(Icons.access_time_filled), Tooltip: 'Tiempo'),
                              buildTabItem(Index: 3, IconVar: Icon(Icons.medication), Tooltip: 'Salud'),

                            ],
                            
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text('Inicio', style: TextStyle(color: Colors.orange),),
                        ],
                      )
                      
                    ],
                  )
       
      ;
    */

  }



  Widget buildTabItem({
    required int Index, 
    required Icon IconVar,
    required String Tooltip,
  }) {
    bool isSelected = Index == widget.VarIndex;    
    return IconTheme(
    
      data: IconThemeData(
        color: isSelected ? Colors.orange[700] : Colors.grey[350],
        size: isSelected ? 34 : 25,
      
      ), 
      child: IconButton(
        
        icon: IconVar,
        tooltip: Tooltip,
        onPressed: () => widget.OnChangeTab(Index),
      )
    );
  }
  
/*
  Widget buildTabItem({
    required int Index, 
    required Icon IconVar,
  }) {
    bool isSelected = Index == widget.VarIndex;    
    return Container(

      child: Row(
              children: <Widget>[
                Row(
                  children: [
                    IconTheme(
        data: IconThemeData(
          color: isSelected ? Colors.orange[700] : Colors.grey[350],
          size: isSelected ? 34 : 25,
        ), 
        child: IconButton(
          icon: IconVar,
          onPressed: () => widget.OnChangeTab(Index),
        )
      ),
      
                  ],
                ),
                Row(children: [
                  Text('Hola'),
                  Text('Hola'),
                  Text('Hola'),
                  Text('Hola'),
                  Text('Hola'),
                ],)
                
      ]),
      
      
    );
  }
*/  

}