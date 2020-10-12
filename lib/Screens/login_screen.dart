import 'package:down_beat/Screens/HomePage.dart';
import 'package:down_beat/Screens/band_list_screen.dart';
import 'package:down_beat/Screens/map_place_screen.dart';
import 'package:down_beat/Screens/register_screen.dart';
import 'file:///E:/projects/down_beat/lib/Screens/reset_password_screen.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_screen extends StatefulWidget {
  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  // Keys
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var form_Key = GlobalKey<FormState>();


  var authc =FirebaseAuth.instance;
  String email;
  String password;
  final FocusNode _firstInput = new FocusNode();
  final FocusNode _secondInput = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            child: Form(
              autovalidate: true,
              key: form_Key,
              child: LayoutBuilder(builder: (context , constrains){
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _signinText(constrains),
                      Comman.sizeBoxheight(25.0),
                      _inputUserName(constrains),
                      Comman.sizeBoxheight(20.0),
                      _inputPassword(constrains),
                      Comman.sizeBoxheight(45.0),
                      _signinButton(constrains),
                      Comman.sizeBoxheight(20.0),
                      _registerButton(constrains),
                      Comman.sizeBoxheight(15.0),
                      _forgotPassText(),
                      Comman.sizeBoxheight(10.0),
                      _otherSignupButton(constrains),
                    ],
                  ),
                );
              }),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }

  // signin text
  _signinText(BoxConstraints constraints){
    return Container(
      child: Text(Txt.Signin_text,style: TextStyle(
          fontSize: 40,
          color: Colors.white),
      ),
    );
  }

  // Input User Name
  _inputUserName(BoxConstraints constraints){
    return TextFormField(
      onChanged: (value){
        setState(() {
          email = value;
        });
      },
      inputFormatters: [
        new BlacklistingTextInputFormatter(new RegExp('[\\ ]')),
      ],
      maxLength: 30,
        cursorColor: Colors.white,
        focusNode: _firstInput,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_secondInput),
        autocorrect: true,
      style: TextStyle(color: Colors.white,fontSize: 20.0),
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
          errorStyle: _error_style(context),
            hintText: 'username',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            border: InputBorder.none,
        ),
        validator: (value) {
        if (value.trim().isEmpty) {
          return Txt.EmailBlank;
        } else if (!Validation.isValidEmail(value.trim())) {
          return Txt.Valid_email;
        } else {
          return null;
        }
      },
      );
  }

  // Input Password
  _inputPassword(BoxConstraints constraints){
    return TextFormField(
      onChanged: (value){
        setState(() {
          password = value;
        });
        print('onChanged $password');

      },
      maxLength: 12,
      inputFormatters: [
        new BlacklistingTextInputFormatter(new RegExp('[\\ ]')),
      ],
      style: TextStyle(color: Colors.white,fontSize: 20.0),
      cursorColor: Colors.white,
      focusNode: _secondInput,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      obscureText: true,
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
          hintText: '........',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        border: InputBorder.none,
        errorStyle: _error_style(context),
      ),
        validator: (value) {
        if (value.trim().isEmpty) {
          return Txt.PassBlank;
        } else if (value.trim().length < 8) {
          return Txt.PasswordLength;
        } else {
          return null;
        }
      },
    );
  }

  // Signin Buttton

  _signinButton(BoxConstraints constraints){
    return MaterialButton(
        height: constraints.maxHeight * 0.07,
        minWidth: constraints.maxWidth * 1,
        padding: const EdgeInsets.all(15.0),
        onPressed: () async{
          FormState formState = form_Key.currentState;
        try{
            var usersignin = await authc.signInWithEmailAndPassword(
                email: email,
                password: password);
            print(usersignin);
            if(formState.validate()){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Map_Place_Screen()));
            }
            else if(usersignin.user != null)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Map_Place_Screen()));
              }
          }catch(e){
            print(e);
          }
        },
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          Txt.Signin_button_text,
          style: TextStyle(
              fontSize: constraints.maxWidth * 0.055,
              color: Colors.purple[900],
              fontWeight: FontWeight.w400),
        )
    );
  }

  // Register Button
  _registerButton(BoxConstraints constraints){
    return MaterialButton(
      height: constraints.maxHeight * 0.07,
      minWidth: constraints.maxWidth * 1,
      padding: const EdgeInsets.all(15.0),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Register_Screen()));
      },
      color: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        Txt.Register_button_text,
        style: TextStyle(
            fontSize: constraints.maxWidth * 0.055,
            color: Colors.white,
            fontWeight: FontWeight.w400),
      )
          );
  }

  // forget password text
  _forgotPassText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Text(Txt.Forgot_pass_text,
        style: TextStyle(
            color: Colors.white),
      ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Reset_Password()));
          },
          child: Text(Txt.Reset_here_text,
            style: TextStyle(
                color: Colors.white),
          ),
        )
    ],
      );
  }

  // facebook twitter and google signup button
  _otherSignupButton(BoxConstraints constraints){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: constraints.maxHeight*0.18,
          width: constraints.maxWidth*0.18,
          child: IconButton(icon: Image.asset(Img.facebook_image),
              onPressed: (){}),
        ),
        Container(
          height: constraints.maxHeight*0.18,
          width: constraints.maxWidth*0.18,
          child: IconButton(icon: Image.asset(Img.twitter_image),
              onPressed: (){}),
        ),
        Container(
          height: constraints.maxHeight*0.18,
          width: constraints.maxWidth*0.18,
          child: IconButton(icon: Image.asset(Img.google_plus),
              onPressed: (){}),
        ),
      ],
    );
  }

  //Error text style
  _error_style(BuildContext ctx) {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: Comman.displayWidth(context) * 0.045);
  }
}
