import 'package:down_beat/modules/bandShowitems.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/bandshowchildwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class MapBands_child extends StatelessWidget {
  var mapbandData;

  MapBands_child({Key key, this.mapbandData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Comman.displayHeight(context) * 0.020,
        left: Comman.displayHeight(context) * 0.020,
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      child: LayoutBuilder(builder: (context, constrains) {
        return GestureDetector(
          onTap: (){
            print("hello");
            _detailsBottomSheet(context);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      height: constrains.maxHeight * 0.50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                          mapbandData['picture'] != null
                            ? mapbandData['picture'] : '',))
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mapbandData['band_name'] != null
                                ? mapbandData['band_name']
                                : '',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red[600],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Comman.sizeBoxheight(15.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mapbandData['title'] != null
                            ? mapbandData['title'] : '',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        mapbandData['location'] != null
                            ? mapbandData['location'] : '',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Comman.sizeBoxheight(10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBar.readOnly(
                            size: 20.0,
                            filledColor: Colors.yellow[500],
                            emptyColor: Colors.grey,
                            initialRating: 3.5,
                            isHalfAllowed: true,
                            halfFilledIcon: Icons.star_half,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                          ),
                          Text("4.2 avg",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                      Text("\$ ${mapbandData['amount'].toString()}",
                        style: TextStyle(
                          color: Colors.purple[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }


  // Bottom Sheet
  _detailsBottomSheet(ctx){
    showModalBottomSheet(context: ctx, builder: (context){
      return Column(
        children:[
          _bandImage(context),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height*0.31,
            child: DefaultTabController(
              length: 3,
              child:  Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.045,
                    color: Colors.white,
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            labelStyle: TextStyle(fontSize: 18.0),
                            indicatorColor: Colors.purple,
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.purple,
                            tabs: [
                              Text("Shows"),
                              Text("About Us"),
                              Text("Album"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Container(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: BandShow.band_show_item.length,
                          itemBuilder: (context, index) {
                            return BandShowChild(
                                showData: BandShow.band_show_item[index]);
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          child: Text(Txt.about_text,textAlign: TextAlign.justify,)),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children:[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: object.length,
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                              ),
                              itemBuilder: (context, i) {
                                return
                                  Image(
                                    image: AssetImage(object[i]['image']),
                                  );
                              },
                            ),
                          ),
                          Comman.sizeBoxheight(20.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  // Band Image
  _bandImage(context){
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height*0.25,
      child: Column(
        children:[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(mapbandData['picture'] != null
                          ? mapbandData['picture'] : '',
                      )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mapbandData['band_name'] != null
                        ? mapbandData['band_name'] : '', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0),),
                    Icon(Icons.favorite_border,color: Colors.white,),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RatingBar.readOnly(
                      size: 20.0,
                      filledColor: Colors.yellow[500],
                      emptyColor: Colors.yellow[500],
                      initialRating: 5,
                      halfFilledIcon: Icons.star_half,
                      isHalfAllowed: true,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                    ),
                    Text("(150)",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.favorite,color: Colors.purple,),
                    Text("(150)"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //List of images
  List<Map<String , dynamic>> object = [
    {
      "image": "assets/imgs/album-01.png",
    },
    {
      "image": "assets/imgs/album-02.png",
    },
    {
      "image": "assets/imgs/album-03.png",
    },
    {
      "image": "assets/imgs/album-04.png",
    },
    {
      "image": "assets/imgs/album-05.png",
    },
    {
      "image": "assets/imgs/album-06.png",
    },
    {
      "image": "assets/imgs/album-07.png",
    },
    {
      "image": "assets/imgs/album-08.png",
    },
    {
      "image": "assets/imgs/album-09.png",
    },
    {
      "image": "assets/imgs/album-10.png",
    },
    {
      "image": "assets/imgs/album-11.png",
    },
    {
      "image": "assets/imgs/album-12.png",
    },
  ];


}
