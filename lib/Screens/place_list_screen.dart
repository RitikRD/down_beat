import 'package:down_beat/modules/place_screen_itemlist.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/dimention.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/appsearchbar.dart';
import 'package:down_beat/widgets/customappbar.dart';
import 'package:down_beat/widgets/drawer.dart';
import 'package:down_beat/widgets/placechildwidget.dart';
import 'package:flutter/material.dart';

class Place_List_Screen extends StatefulWidget {
  @override
  _Place_List_ScreenState createState() => _Place_List_ScreenState();
}

class _Place_List_ScreenState extends State<Place_List_Screen> {
  @override
  Widget build(BuildContext context) {
    var appBar = CustomAppBar(
        title: Txt.Discover_text,
        toolbarColor: Colors.white,
    );
    return Scaffold(
      endDrawer: DrawerChildWidget(),
      appBar: appBar,
      body: Container(
        height: Comman.displaySize(context).height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top -
            Dimentions.bottomiconHeight,
        width: Comman.displaySize(context).width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              LayoutBuilder(builder: (context , constrains){
                return Column(
                    children: [
                      _listOfPlace(constrains),
                    ],
                  );
              })
            ],
          ),
        ),
      ),
    );
  }


  // list of places
  _listOfPlace(BoxConstraints constraints){
    return Container(
      height: Comman.displaySize(context).height*0.90,
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
            itemCount: Place.Place_list_items.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
            ),
            itemBuilder: (context , index){
              return PlaceChildWidget(placeData: Place.Place_list_items[index]);
            }),
      ),
    );
  }
}

