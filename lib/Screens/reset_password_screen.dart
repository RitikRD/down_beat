import 'package:down_beat/Screens/account_screen.dart';
import 'package:down_beat/Screens/change_password_screen.dart';
import 'package:down_beat/Screens/setting_screen.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:flutter/material.dart';

class Reset_Password extends StatefulWidget {
  @override
  _Reset_PasswordState createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  final FocusNode _firstInput = new FocusNode();
  final FocusNode _secondInput = new FocusNode();
  final FocusNode _thirdInput = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Comman.displaySize(context).height,
          width: Comman.displaySize(context).width,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Img.Full_img,),
                  ),
                ),
                child: LayoutBuilder(builder: (context , constrains){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _resetText(constrains),
                            Comman.sizeBoxheight(30.0),
                            _inputUserName(constrains),
                            Comman.sizeBoxheight(20.0),
                            _newPassword(constrains),
                            Comman.sizeBoxheight(20.0),
                            _confirmNewPassword(constrains),
                            Comman.sizeBoxheight(45.0),
                            _saveButton(constrains),
                            Comman.sizeBoxheight(15.0),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // signin text
  _resetText(BoxConstraints constraints){
    return Container(
      child: Text(Txt.Reset_text,style: TextStyle(
          fontSize: 40,
          color: Colors.white),
      ),
    );
  }
  // Input User Name
  _inputUserName(BoxConstraints constraints){
    return TextField(
      style: TextStyle(color: Colors.white,fontSize: 20.0),
      cursorColor: Colors.white,
      focusNode: _firstInput,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_secondInput),
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(70, 70, 90, 0.10).withOpacity(0.30),
          filled: true,
          contentPadding: const EdgeInsets.all(0.0),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white,
            size: 30.0,
          ),
          hintText: 'Username',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          border: InputBorder.none),
    );
  }

  // Password
  _newPassword(BoxConstraints constraints){
    return TextField(
      style: TextStyle(color: Colors.white,fontSize: 20.0),
      cursorColor: Colors.white,
      focusNode: _secondInput,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_thirdInput),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(70, 70, 90, 0.10).withOpacity(0.30),
          filled: true,
          contentPadding: const EdgeInsets.all(0.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
            size: 30.0,
          ),
          hintText: 'New Password',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          border: InputBorder.none),
    );
  }

// Confirm Password
  _confirmNewPassword(BoxConstraints constraints){
    return TextField(
      style: TextStyle(color: Colors.white,fontSize: 20.0),
      cursorColor: Colors.white,
      focusNode: _thirdInput,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(70, 70, 90, 0.10).withOpacity(0.30),
          filled: true,
          contentPadding: const EdgeInsets.all(0.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
            size: 30.0,
          ),
          hintText: 'Confirm New Password',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          border: InputBorder.none),
    );
  }

  // Save Button
  _saveButton(BoxConstraints constraints){
    return MaterialButton(
        height: constraints.maxHeight * 0.07,
        minWidth: constraints.maxWidth * 1,
        padding: const EdgeInsets.all(15.0),
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => Account_screen()));
        },
        color: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          Txt.Save_button_text,
          style: TextStyle(
            fontSize: constraints.maxWidth * 0.055,
            color: Colors.white,),
        )
    );
  }
}
