import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Change_Password_screen extends StatefulWidget {
  @override
  _Change_Password_screenState createState() => _Change_Password_screenState();
}

class _Change_Password_screenState extends State<Change_Password_screen> {
  final FocusNode _firstInput = new FocusNode();
  final FocusNode _secondInput = new FocusNode();
  final FocusNode _thirdInput = new FocusNode();
  var _underlineborder = UnderlineInputBorder(
    borderSide: BorderSide(
        color: Color.fromRGBO(216, 216, 216, 1.0),
        width: 1.0,
        style: BorderStyle.solid),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: Colors.black,),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(Txt.Change_pass_text,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: Comman.displaySize(context).height,
          width: Comman.displaySize(context).width,
          child: LayoutBuilder(builder: (context , constrains){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Comman.sizeBoxheight(30.0),
                  _oldPassword(constrains),
                  Comman.sizeBoxheight(20.0),
                  _newPassword(constrains),
                  Comman.sizeBoxheight(20.0),
                  _confirmNewPassword(constrains),
                  Comman.sizeBoxheight(45.0),
                ],
              ),
            );
          }),
        ),
      ),
      bottomSheet: _botttomButton(),
    );
  }

  // Input User Name
  _oldPassword(BoxConstraints constraints){
    return TextField(
      style: TextStyle(color: Colors.black,fontSize: 20.0),
      cursorColor: Colors.black,
      focusNode: _firstInput,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_secondInput),
      autocorrect: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(200, 200, 200, 0.10).withOpacity(0.30),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 8),
          hintText: 'Old Password',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
          ),
          focusedBorder: _underlineborder,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }

  // Password
  _newPassword(BoxConstraints constraints){
    return TextField(
      style: TextStyle(color: Colors.black,fontSize: 20.0),
      cursorColor: Colors.black,
      focusNode: _secondInput,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_thirdInput),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(200, 200, 200, 0.10).withOpacity(0.30),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 8.0),
          hintText: 'New Password',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
          ),
          focusedBorder: _underlineborder,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)
          )),
    );
  }

// Confirm Password
  _confirmNewPassword(BoxConstraints constraints){
    return TextField(
      style: TextStyle(color: Colors.black,fontSize: 20.0),
      cursorColor: Colors.black,
      focusNode: _thirdInput,
      textAlignVertical: TextAlignVertical.top,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(200, 200, 200, 0.10).withOpacity(0.30),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 8.0),
          hintText: 'Confirm New Password',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
          ),
          focusedBorder: _underlineborder,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)
          )),
    );
  }

  // Bottom Buttton
  _botttomButton(){
    return Container(
        width: double.infinity,
        child: MaterialButton(
          color: Color.fromRGBO(68, 215, 182, 1),
          padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
          onPressed: () {},
          child: Text(
            "Update",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.04,
              color: Colors.white,),
          ),
        ));
  }
}
