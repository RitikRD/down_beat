import 'package:down_beat/Screens/comment_screen.dart';
import 'package:down_beat/modules/bandShowitems.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/bandshowchildwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:down_beat/utils/img.dart';

class PlaceChildWidget extends StatefulWidget {
  var placeData;

  PlaceChildWidget({Key key, this.placeData});

  @override
  _PlaceChildWidgetState createState() => _PlaceChildWidgetState();
}

class _PlaceChildWidgetState extends State<PlaceChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(builder: (context, constrains) {
        return GestureDetector(
          onTap: () {
            _showdialoge(constrains);
          },
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    backgroundImage: AssetImage(
                      widget.placeData['picture'] != null
                          ? widget.placeData['picture']
                          : '',
                    ),
                  ),
                  Text(
                    widget.placeData['title_name'] != null
                        ? widget.placeData['title_name']
                        : '',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

// Show Dialoge Box
  _showdialoge(BoxConstraints constraints) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              color: Colors.white,
              height: constraints.maxHeight *1.40,
              width: constraints.maxWidth * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            width: constraints.maxWidth * 0.30,
                            height: constraints.maxHeight * 0.30,
                            child: Image.asset(
                              widget.placeData['picture'] != null
                                  ? widget.placeData['picture']
                                  : '',
                            )),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.placeData['title_name'] != null
                                    ? widget.placeData['title_name']
                                    : '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0),
                              ),
                              Text(
                                widget.placeData['location'] != null
                                    ? widget.placeData['location']
                                    : '',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0),
                              ),
                              Row(
                                /*mainAxisAlignment: MainAxisAlignment.spaceAround,*/
                                children: [
                                  Row(
                                    children: [
                                      RatingBar.readOnly(
                                        size: 18.0,
                                        filledColor: Colors.yellow[500],
                                        emptyColor: Colors.yellow[500],
                                        initialRating: 5,
                                        halfFilledIcon: Icons.star_half,
                                        isHalfAllowed: true,
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                      ),
                                      Text(
                                        "4.7 avg",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      icon: Image.asset(
                                        Img.chat_image,
                                        height: 20,
                                        width: 20,
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Comment_Screen()));
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.16,
                    child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(30),
                          child: Container(
                            color: Colors.white,
                            child: SafeArea(
                              child: Column(
                                children: <Widget>[
                                  TabBar(
                                    labelStyle: TextStyle(fontSize: 16.0),
                                    indicatorColor: Colors.purple,
                                    unselectedLabelColor: Colors.grey,
                                    labelColor: Colors.purple,
                                    tabs: [
                                      Text("Entry"),
                                      Text("Parking"),
                                      Text("Food"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        body: TabBarView(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                    Text(Txt.attribute_text,style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
