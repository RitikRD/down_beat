import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payments_Info_Screen extends StatefulWidget {
  @override
  _Payments_Info_ScreenState createState() => _Payments_Info_ScreenState();
}

class _Payments_Info_ScreenState extends State<Payments_Info_Screen> {
  final FocusNode _firstInput = new FocusNode();
  final FocusNode _secondInput = new FocusNode();
  final FocusNode _thirdInput = new FocusNode();
  final FocusNode _fourthInput = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Payment Info",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        color: Colors.white,
        height: Comman.displaySize(context).height,
        width: Comman.displaySize(context).width,
        child: LayoutBuilder(builder: (context, constrains) {
          return Column(
            children: [
              Comman.sizeBoxheight(60.0),
              _card(constrains),
              Comman.sizeBoxheight(40.0),
              _inputName(constrains),
              Comman.sizeBoxheight(10),
              _inputCardNum(constrains),
              Comman.sizeBoxheight(10),
              _inputdataCVV(constrains),
            ],
          );
        }),
      ),
      bottomSheet: _botttomButton(),
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
            "Save",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.white,),
          ),
        ));
  }
  // Choose Card Issuer
  _card(BoxConstraints constraints) {
    return Column(
      children: [
        Text(Txt.choose_card_text,style: TextStyle(
            fontSize: 18.0,
            color: Colors.black),),
        Comman.sizeBoxheight(10.0),
        Container(
          width: constraints.maxWidth * 0.80,
          height: constraints.maxHeight * 0.050,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Img.visa_card_image),
              Image.asset(Img.diner_card_image),
              Image.asset(Img.american_express_image),
              Image.asset(Img.discover_image),
              Image.asset(Img.mastercard_image),
            ],
          ),
        ),
      ],
    );
  }

  // Input Name
  _inputName(BoxConstraints constraints) {
    return TextField(
      cursorColor: Colors.black,
      focusNode: _firstInput,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_secondInput),
      autocorrect: true,
      style: TextStyle(color: Colors.black,fontSize: 18.0),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          hintText: 'name',
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 18.0,
          ),
          border: InputBorder.none),
    );
  }

  // Input Name
  _inputCardNum(BoxConstraints constraints) {
    return TextField(
      cursorColor: Colors.black,
      focusNode: _secondInput,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_thirdInput),
      autocorrect: true,
      style: TextStyle(color: Colors.black, fontSize: 18.0),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          hintText: 'card number',
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 18.0,
          ),
          border: InputBorder.none),
    );
  }

  // Month and Year with CVV
  _inputdataCVV(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: TextField(
              cursorColor: Colors.black,
              focusNode: _thirdInput,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.next,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_fourthInput),
              style: TextStyle(color: Colors.black,fontSize: 18.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  hintText: 'month/year',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18.0,
                  ),
                  border: InputBorder.none),
            ),
          ),
          Comman.sizeBoxwidth(15.0),
          Flexible(
              child: TextField(
                cursorColor: Colors.black,
                focusNode: _fourthInput,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.done,
                autocorrect: true,
                style: TextStyle(color: Colors.black,fontSize: 18.0),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
                    filled: true,
                    contentPadding: const EdgeInsets.all(8),
                    hintText: 'CVV',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none),
              ),
          ),
        ],
      ),
    );
  }
}
