import 'package:down_beat/Screens/setting_screen.dart';
import 'package:down_beat/Screens/tickets.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/dimention.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/customappbar.dart';
import 'package:down_beat/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account_screen extends StatefulWidget {
  @override
  _Account_screenState createState() => _Account_screenState();
}

class _Account_screenState extends State<Account_screen> {
  @override
  Widget build(BuildContext context) {
    var appBar = CustomAppBar(
        title: Txt.Account_text,
    );
    return Scaffold(
      endDrawer: DrawerChildWidget(),
      appBar: appBar,
      body: Container(
        height: Comman.displaySize(context).height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top -
            Dimentions.bottomNavHeight,
        width: Comman.displaySize(context).width,
        child: LayoutBuilder(builder: (context , constrains){
          return Column(
            children: [
              _circleImgRow(constrains),
              Comman.sizeBoxheight(10.0),
              _bandVenue(constrains),
              Comman.sizeBoxheight(10.0),
              _address(constrains),
              Comman.sizeBoxheight(10.0),
              _phone(constrains),
              Comman.sizeBoxheight(10.0),
              _email(constrains),
              Comman.sizeBoxheight(10.0),
              _payments(constrains),
              Comman.sizeBoxheight(10.0),
              _websiteURL(constrains),
            ],
          );
        }),
      ),
    );
  }
  // My Ticket, Profile Image and setting
  _circleImgRow(BoxConstraints constraints){
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Tickets_Screen()));
            },
            child: Column(
              children: [
                Image.asset(Img.ticket_image,width: 30.0,height: 30.0,),
                Text(Txt.My_ticket_text,style: TextStyle(fontSize: 14.0),),
              ],
            ),
          ),
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: AssetImage(Img.profile_pic),
              ),
              Text(Txt.Change_text,style: TextStyle(color: Colors.grey,fontSize: 14.0,decoration: TextDecoration.underline),),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Setting_Screen()));
                  },
                  child: Image.asset(Img.settings_image,width: 30,height: 30,)),
              Text(Txt.Setting_text,style: TextStyle(fontSize: 14.0),),
            ],
          ),
        ],
      ),
    );
  }

  //Band/Venue Name
  _bandVenue(BoxConstraints constraints){
    return Container(
      alignment: Alignment.centerLeft,
      width: constraints.maxWidth*1,
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.only(left: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Text(Txt.Band_venue_text,
        style: _textstyle,
      ),
    );
  }
  //Address
  _address(BoxConstraints constraints){
    return Container(
      alignment: Alignment.centerLeft,
      width: constraints.maxWidth*1,
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.only(left: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Text(Txt.Address_text,
        style: _textstyle,
      ),
    );
  }
  //Phone
  _phone(BoxConstraints constraints){
    return Container(
      alignment: Alignment.centerLeft,
      width: constraints.maxWidth*1,
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.only(left: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Text(Txt.Phone_text,
        style: _textstyle,
      ),
    );
  }

  // E-mail
  _email(BoxConstraints constraints){
    return Container(
      alignment: Alignment.centerLeft,
      width: constraints.maxWidth*1,
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.only(left: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Text(Txt.Email_tex,
        style: _textstyle,
      ),
    );
  }

  // Payments
  _payments(BoxConstraints constraints){
    return Container(
      alignment: Alignment.centerLeft,
      width: constraints.maxWidth*1,
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.only(left: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Text(Txt.Payment_text,
        style: _textstyle,
      ),
    );
  }

  // WebSite URL
  _websiteURL(BoxConstraints constraints){
    return Container(
      alignment: Alignment.centerLeft,
      width: constraints.maxWidth*1,
      height: constraints.maxHeight*0.09,
      padding: const EdgeInsets.only(left: 16.0),
      color: Color.fromRGBO(50, 180,180,0.10),
      child: Text(Txt.Web_url_text,
        style: _textstyle,
      ),
    );
  }
  //text style
  var _textstyle = TextStyle(
      fontSize: 16,
      color: Colors.grey);
}
