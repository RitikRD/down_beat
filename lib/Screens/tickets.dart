import 'package:down_beat/modules/ticketslistitems.dart';
import 'package:down_beat/widgets/ticketschildWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tickets_Screen extends StatefulWidget {
  @override
  _Tickets_ScreenState createState() => _Tickets_ScreenState();
}

class _Tickets_ScreenState extends State<Tickets_Screen> {
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
            color: Colors.black),),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(builder: (context , constrains){
          return Container(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: Ticket.Tickets_list_items.length,
                  itemBuilder: (context , index) {
                    return TicketChildWidget(
                      ticketData: Ticket.Tickets_list_items[index],);
                  }),
            ),
          );
        }),
      ),
    );
  }
}
