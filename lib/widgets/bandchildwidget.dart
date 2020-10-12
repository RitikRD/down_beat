import 'package:down_beat/modules/bandShowitems.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:down_beat/widgets/bandshowchildwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class BandchildWidget extends StatefulWidget {

  var bandData;
  BandchildWidget({Key key ,this.bandData});

  @override
  _BandchildWidgetState createState() => _BandchildWidgetState();
}

class _BandchildWidgetState extends State<BandchildWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(builder: (context, constrains) {
        return GestureDetector(
          onTap: () {
            print("hello");
            _detailsBottomSheet(context);
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
                      widget.bandData['picture'] != null
                          ? widget.bandData['picture'] : '',
                    ),
                  ),
                  Text(widget.bandData['title_name'] != null
                      ? widget.bandData['title_name'] : '', style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0), textAlign: TextAlign.center,),
                ],
              ),
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
          _bandImage(),
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
  _bandImage(){
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
                    image: AssetImage(widget.bandData['picture'] != null
                        ? widget.bandData['picture'] : '',
                    )
                  ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.bandData['title_name'] != null
                      ? widget.bandData['title_name'] : '', style: TextStyle(
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
