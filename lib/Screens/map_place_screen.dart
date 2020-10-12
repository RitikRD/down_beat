import 'package:down_beat/modules/mapbandsitems.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/appsearchbar.dart';
import 'package:down_beat/widgets/customappbar.dart';
import 'package:down_beat/widgets/drawer.dart';
import 'package:down_beat/widgets/mapbandschild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rating_bar/rating_bar.dart';

import 'comment_screen.dart';

class Map_Place_Screen extends StatefulWidget {
  @override
  _Map_Place_ScreenState createState() => _Map_Place_ScreenState();
}

class _Map_Place_ScreenState extends State<Map_Place_Screen> {
  bool viewVisible = false;
  void showWidegt(){
    setState(() {
      viewVisible = true;
    });
  }

  GoogleMapController mapController;
  final LatLng _center = const LatLng(26.823361, 75.617998);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var appBar = CustomAppBar(
        title: Txt.Discover_text,
        toolbarColor: Colors.white,
    );
    return Scaffold(
      appBar: appBar,
      endDrawer: DrawerChildWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            _googleMap(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBar(),
                _bandOverview(),
                _bandsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Google Map
  _googleMap(){
    return GoogleMap(
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 9.0,
      ),
    );
  }

  // show band overview
  _bandOverview(){
    return Stack(
      alignment: Alignment.center,
      children:[
        Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height *0.30,
        width: MediaQuery.of(context).size.width*0.78,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height *0.10,
                      width: MediaQuery.of(context).size.width*0.15,
                      child: Image.asset(
                        Img.map_dialog_image,
                      )),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Txt.novo_text,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                        Text(
                        Txt.location_text,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0),
                        ),
                        Row(
                          /*mainAxisAlignment: MainAxisAlignment.spaceBetween,*/
                          children: [
                            Row(
                              children: [
                                RatingBar.readOnly(
                                  size: 15.0,
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
                            Comman.sizeBoxwidth(15.0),
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
            Visibility(
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              visible: viewVisible,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.155,
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
                                labelStyle: TextStyle(fontSize: 14.0),
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
            ),
          ],
        ),
      ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(right: 20,bottom: 215),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.purple[500],
              shape: BoxShape.circle,
            ),
            child: IconButton(icon: Icon(
              Icons.add,color: Colors.white),
              onPressed: showWidegt,
            ),
          ),
        ),
    ],
    );
  }

  // Horizontal Bands List
  _bandsList(){
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height*0.30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: MapList.Map_list_items.length,
        itemBuilder: (context, index) {
          return MapBands_child(
            mapbandData: MapList.Map_list_items[index],
          );
        },
      ),
    );
  }
}
