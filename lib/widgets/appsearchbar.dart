import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:down_beat/utils/txt.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  /*var data = ['VIP Sectiion', 'Bottle service',];
  int _value = 1;*/
  var data = ['VIP Sectiion', 'Bottle service','VIP Sectiion', 'Bottle service',];
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(163, 35, 165, 1.0),
        height: Comman.displaySize(context).height * 0.10,
        width: Comman.displaySize(context).width * 1,
        child: Container(
          margin: EdgeInsets.all(Comman.displayHeight(context) * 0.020),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(69, 91, 99, 0.10).withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0.0, 8.0), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            enabled: true,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    _filterBottomSheet(context);
                  },
                  icon: Image(
                    image: AssetImage(Img.searchbar_filter_img),
                    height: 26,
                    width: 26,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 28,
                ),
                hintText: Txt.search_bar_text,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  // filter option
  _filterOption(){
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
            label: Text(data[index]),
            selected: _value == index,
            selectedColor: Colors.green,
            onSelected: (bool value) {
              setState(() {
                _value = value ? index : null;
              });
            },

            backgroundColor: Colors.blue,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

  // Filter Bottom Sheet
  _filterBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Scaffold(
            body: Column(
              children: [
                _filterScreenText(),
                Comman.sizeBoxheight(10.0),
                //_filterOption()
              ],
            ),
            bottomSheet: _botttomButton(),
          );
        });
  }
  // Bottom Buttom
  _botttomButton(){
    return Container(
        width: double.infinity,
        child: MaterialButton(
          color: Color.fromRGBO(68, 215, 182, 1),
          padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
          onPressed: () {},
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.04,
              color: Colors.white,),
          ),
        ));
  }

  // Filter , By dates and By Interests Text
  _filterScreenText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Txt.filter_text,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Image.asset(
                  Img.x_image,
                  width: 20,
                  height: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Comman.sizeBoxheight(15.0),
          Text(
            Txt.by_dates_text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Comman.sizeBoxheight(10.0),
          TextField(
            style: TextStyle(
                color: Colors.black, fontSize: 20.0),
            cursorColor: Colors.black,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.done,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(70, 70, 90, 0.10).withOpacity(0.30),
                filled: true,
                contentPadding: const EdgeInsets.only(left: 8.0),
                hintText: 'Select a Date',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none
                )),
          ),
          Comman.sizeBoxheight(20.0),
          Text(Txt.by_interest_text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),
        ],
      ),
    );
  }

}
