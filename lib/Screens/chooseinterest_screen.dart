import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChooseInterest_Screen extends StatefulWidget {
  @override
  _ChooseInterest_ScreenState createState() => _ChooseInterest_ScreenState();
}

class _ChooseInterest_ScreenState extends State<ChooseInterest_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.white,
        child: LayoutBuilder(builder: (context, constrains){
          return Container(
            child: Column(
              children: [
                Text("Choose Interests",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0),),
                _chooseInterests(),
              ],
            ),
          );
        })
      ),
    );
  }

  // Interests
  _chooseInterests() {
    return Card(
      color: Colors.purple[500],
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('VIP Section',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bottle Service',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Hooksh',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Derts',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Table Top',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bartending',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('VIP Section',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bottle Service',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Hooksh',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Derts',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Table Top',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bartending',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('VIP Section',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bottle Service',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Hooksh',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Derts',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Table Top',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bartending',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('VIP Section',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bottle Service',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Hooksh',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Derts',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Table Top',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bartending',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('VIP Section',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bottle Service',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Hooksh',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Derts',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Table Top',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bartending',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('VIP Section',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bottle Service',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Hooksh',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Derts',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Table Top',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black,
                    child: new Text('Bartending',
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}