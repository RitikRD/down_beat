import 'package:down_beat/Screens/showticket_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketChildWidget extends StatelessWidget {
  var ticketData;
  TicketChildWidget({Key key, this.ticketData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width*0.70,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Show_Ticket_Screen()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  Image.asset(ticketData['picture'] != null ?
                  ticketData['picture'] :'',fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height*0.20,
                    width: MediaQuery.of(context).size.width*1,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 12.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text(ticketData['band_name'] != null ?
                            ticketData['band_name'] :'',style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                            Text("@"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(ticketData['title'] != null ?
                            ticketData['title'] :'',style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                            Text(ticketData['location'] != null ?
                            ticketData['location'] :'', style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[500],
                            ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(ticketData['vip_qty'] != null ?
                            ticketData['vip_qty'] :'', style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.purple[700],),),
                            Text(ticketData['general_qty'] != null ?
                            ticketData['general_qty'] :'', style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.purple[700],),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
