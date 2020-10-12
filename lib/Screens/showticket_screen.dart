import 'package:down_beat/utils/img.dart';
import 'package:flutter/material.dart';

class Show_Ticket_Screen extends StatefulWidget {
  @override
  _Show_Ticket_ScreenState createState() => _Show_Ticket_ScreenState();
}

class _Show_Ticket_ScreenState extends State<Show_Ticket_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Tickets",style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20.0),),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(builder: (context, constrains){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _BandandTitle(),
              _barcode(),
            ],
          );
        }),
      ),
    );
  }
  // Band Name With Title
  _BandandTitle(){
    return Container(
      width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 16,
        right: 16,
      ),
      color: Colors.purple[500],
      child: Column(
        children: [
          Text("The Dandy Dans\n@\nThe Coca-Cola Roxy",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
          ),),
        ],
      ),
    );
  }

  // Bar Code
_barcode(){
    return Column(
      children: [
        Image.asset(Img.qr_code_image,
          height: MediaQuery.of(context).size.height*0.40,
          width: MediaQuery.of(context).size.width*0.40,
        ),
        Text("AJG0219",style: TextStyle(
            color: Colors.black,
            fontSize: 18.0),),
        SizedBox(
          height: 15.0,
        ),
        Text("VIP Entry",style: TextStyle(
            color: Colors.purple[500],
            fontWeight: FontWeight.w600,
            fontSize: 24.0),)
      ],
    );
}
}
