import 'package:down_beat/Screens/login_screen.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register_Screen extends StatefulWidget {
  @override
  _Register_ScreenState createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  // Keys
  var _passkey = new GlobalKey<FormFieldState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var form_Key = GlobalKey<FormState>();

  var authc =FirebaseAuth.instance;
  String email;
  String password;
  String Confirm_password;

  final FocusNode _firstInput = new FocusNode();
  final FocusNode _secondInput = new FocusNode();
  final FocusNode _thirdInput = new FocusNode();
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Comman.sizeBoxheight(40.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _joinText(constrains),
                              Comman.sizeBoxheight(30.0),
                              _inputUserName(constrains),
                              Comman.sizeBoxheight(20.0),
                              _inputPassword(constrains),
                              Comman.sizeBoxheight(20.0),
                              _confirmPassword(constrains),
                              Comman.sizeBoxheight(45.0),
                              _registerButton(constrains),
                              Comman.sizeBoxheight(15.0),
                              _otherSignupButton(constrains),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(icon:
                              Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Colors.white,),
                                  onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_screen()));
                                  }),
                              Text("BACK",style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white),),
                            ],
                          ),
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
  _joinText(BoxConstraints constraints){
    return Container(
      child: Text(Txt.Join_text,style: TextStyle(
          fontSize: 40,
          color: Colors.white),
      ),
    );
  }

  // Input User Name
  _inputUserName(BoxConstraints constraints){
    return TextFormField(
      onChanged: (value){
        email = value;
      },
      maxLength: 30,
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
          hintText: 'Create username',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          errorStyle: _error_style(context),
          border: InputBorder.none),
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

  // Password
  _inputPassword(BoxConstraints constraints){
    return TextFormField(
      onChanged: (value){
        password = value;
      },
      maxLength: 12,
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
          hintText: 'Create password',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          errorStyle: _error_style(context),
          border: InputBorder.none),
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

// Confirm Password
  _confirmPassword(BoxConstraints constraints){
    return TextFormField(
      key: _passkey,
      maxLength: 12,
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
          errorStyle: _error_style(context),
          hintText: 'Confirm password',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          border: InputBorder.none),
      validator: (value) {
        var passValue = _passkey.currentState.value;
        if (value.trim().isEmpty) {
          return Txt.ConfimPassBlank;
        } else if (value.trim().length < 8) {
          return Txt.PasswordLength;
        } else if (value.toLowerCase() != passValue.toLowerCase()) {
          return Txt.bothpasswordmatch;
        } else {
          return null;
        }
      },
    );
  }

  // Register Button Button
  _registerButton(BoxConstraints constraints){
    return MaterialButton(
        height: constraints.maxHeight * 0.07,
        minWidth: constraints.maxWidth * 1,
        padding: const EdgeInsets.all(15.0),
        onPressed: () async{
          FormState formState = form_Key.currentState;
          try {
            var user = await authc.createUserWithEmailAndPassword(
                email: email, password: password);
            print(email);
            print(password);

            print(user);
            if(formState.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login_screen()));
            }else if(user.additionalUserInfo.isNewUser==true){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login_screen()));
            }else{
               print("invalid authentication");
            }
          }
          catch(e){
            print(e);
          }
        },
        color: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          Txt.Register_button_text,
          style: TextStyle(
              fontSize: constraints.maxWidth * 0.055,
              color: Colors.white,),
        )
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
          child: IconButton(icon: Image.asset("assets/imgs/facebook.png"), onPressed: (){}),
        ),
        Container(
          height: constraints.maxHeight*0.18,
          width: constraints.maxWidth*0.18,
          child: IconButton(icon: Image.asset("assets/imgs/twitter.png"), onPressed: (){}),
        ),
        Container(
          height: constraints.maxHeight*0.18,
          width: constraints.maxWidth*0.18,
          child: IconButton(icon: Image.asset("assets/imgs/gplush.png"), onPressed: (){}),
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

