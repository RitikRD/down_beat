import 'package:down_beat/modules/band_screen_itemlist.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/dimention.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/appsearchbar.dart';
import 'package:down_beat/widgets/bandchildwidget.dart';
import 'package:down_beat/widgets/customappbar.dart';
import 'package:down_beat/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Band_List_Screen extends StatefulWidget {
  @override
  _Band_List_ScreenState createState() => _Band_List_ScreenState();
}

class _Band_List_ScreenState extends State<Band_List_Screen>
    with SingleTickerProviderStateMixin {
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
              LayoutBuilder(builder: (context, constrains) {
                return Column(
                    children: [
                      _listOfBands(constrains),
                    ],
                  );
              })
            ],
          ),
        ),
      ),
    );
  }

  // List Of Band
  _listOfBands(BoxConstraints constraints) {
    return Container(
      height: Comman.displaySize(context).height * 0.90,
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: Band.Band_list_items.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    print("true");
                  },
                  child:
                      BandchildWidget(bandData: Band.Band_list_items[index]));
            }),
      ),
    );
  }
}
