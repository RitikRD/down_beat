import 'package:down_beat/Screens/account_screen.dart';
import 'package:down_beat/Screens/band_list_screen.dart';
import 'package:down_beat/Screens/map_place_screen.dart';
import 'package:down_beat/Screens/place_list_screen.dart';
import 'package:down_beat/Screens/setting_screen.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/customappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerMenu{
  String titile;
  DrawerMenu({this.titile});
}

class DrawerChildWidget extends StatefulWidget {
  final drawerMenu = [
    DrawerMenu(titile: "Discover"),
    DrawerMenu(titile: "Bands"),
    DrawerMenu(titile: "Places"),
    DrawerMenu(titile: "Account"),
    DrawerMenu(titile: "Settings"),
  ];

  @override
  _DrawerChildWidgetState createState() => _DrawerChildWidgetState();
}

class _DrawerChildWidgetState extends State<DrawerChildWidget> {
 int _selectDrawerIndex = 0;

 _getDrawerItems(int position){
   switch(position){
     case 0:
       return Map_Place_Screen();
     case 1:
       return Band_List_Screen();
     case 2:
       return Place_List_Screen();
     case 3:
       return Account_screen();
     case 4:
       return Setting_Screen();
     default :
       return Text("Empty Drawer");
   }
   }
   _onSelectedItems(int index){
   setState(() => _selectDrawerIndex = index);
     Navigator.of(context).pop();
     switch(index){
       case 0:
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Map_Place_Screen()));         break;
         break;
       case 1:
         //route name pass kro re route name nhi bana rkhe h ky ok
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Band_List_Screen()));
         break;
       case 2:
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Place_List_Screen()));         break;

         break;
       case 3:
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Account_screen()));         break;

         break;
       case 4:
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Setting_Screen()));         break;
         break;
     }
   }
  @override
  Widget build(BuildContext context) {
   List<Widget> drawerOptions = [];
   for(int i = 0; i< widget.drawerMenu.length; i++){
     var j = widget.drawerMenu[i];
     drawerOptions.add(
       ListTile(
         title: Text(j.titile, // ok sir
           textAlign: TextAlign.right,
           style:
             i ==  _selectDrawerIndex ? TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.w600,
                 color: Colors.purple):
           TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.w600,
               color: Colors.black),),
         selected: i == _selectDrawerIndex,
         onTap: () => _onSelectedItems(i),
       ),
     );
   }

    return /*SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(icon: Icon(
                    Icons.arrow_forward,color: Colors.black,),
                      onPressed: (){}),
        Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(
              top: 20.0,
              right: 20.0),
          child: Text(
            drawerOptions,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
        );
                ],
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Image.asset(Img.menu_icon_image,
                  height: 120,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );*/ SafeArea(
      child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      IconButton(icon: Icon(
                        Icons.arrow_forward,color: Colors.black,),
                          onPressed: (){}),
                      ListView(
                        /*mainAxisAlignment: MainAxisAlignment.end,*/
                        shrinkWrap: true,
                        children: drawerOptions,
                      ),
                    ]),
                Column(
                  children:[
                    Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Image.asset(Img.menu_icon_image,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ],
                ),
              ],
            ),
          ),
    );
  }
}

