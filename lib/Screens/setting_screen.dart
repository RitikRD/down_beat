import 'package:down_beat/Screens/account_screen.dart';
import 'package:down_beat/Screens/change_password_screen.dart';
import 'package:down_beat/Screens/payment_info_screen.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/dimention.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/customappbar.dart';
import 'package:down_beat/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Setting_Screen extends StatefulWidget {
  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  var _textstyle = TextStyle(
      fontSize: 16,
      color: Colors.grey);

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    //Custom appbar
    var appBar = CustomAppBar(
      toolbarColor: Colors.white,
      title: Txt.Setting_text,
    );
    return Scaffold(
      appBar: appBar,
      endDrawer: DrawerChildWidget(),
      body: Container(
        height: Comman.displaySize(context).height -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top -
          Dimentions.bottomNavHeight,
        width: Comman.displaySize(context).width,
        child: LayoutBuilder(builder: (context , constrains){
          return Column(
            children: [
              Comman.sizeBoxheight(30.0),
              _pushNotification(constrains),
              Comman.sizeBoxheight(15.0),
              _changePassword(constrains),
              Comman.sizeBoxheight(15.0),
              _taxInformation(constrains),
              Comman.sizeBoxheight(15.0),
              _logout(constrains),
            ],
          );
        }),
    ),
    );
  }
  // push notification
  _pushNotification(BoxConstraints constraints){
    return Container(
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Txt.Push_notif_text,
            style: _textstyle),
          Transform.scale(
            scale: 1.5,
            child: Switch.adaptive(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeTrackColor: Color.fromRGBO(163, 35, 165, 0.60),
              activeColor: Color.fromRGBO(163,35,165 ,1.0),
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: Colors.white,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Change Password
  _changePassword(BoxConstraints constraints){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Change_Password_screen()));
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: constraints.maxWidth*1,
        height: constraints.maxHeight*0.09,
        padding: const EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(50, 180,180,0.10),
        child: Text(Txt.Change_pass_text,
        style: _textstyle,
        ),
      ),
    );
  }
  // Tax Information
  _taxInformation(BoxConstraints constraints){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Payments_Info_Screen()));
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: constraints.maxWidth*1,
        height: constraints.maxHeight*0.09,
        padding: const EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(50, 180,180,0.10),
        child: Text(Txt.Tax_info_text,
          style: _textstyle,
        ),
      ),
    );
}
  // Logout
  _logout(BoxConstraints constraints){
    return GestureDetector(
      onTap: (){},
      child: Container(
        alignment: Alignment.centerLeft,
        width: constraints.maxWidth*1,
        height: constraints.maxHeight*0.09,
        padding: const EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(50, 180,180,0.10),
        child: Text(Txt.Logout_text,
          style: _textstyle,
        ),
      ),
    );
  }
}
