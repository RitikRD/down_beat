import 'package:down_beat/modules/comment_listitems.dart';
import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/img.dart';
import 'package:down_beat/widgets/commentchildwidget.dart';
import 'package:flutter/material.dart';

class Comment_Screen extends StatefulWidget {
  @override
  _Comment_ScreenState createState() => _Comment_ScreenState();
}

class _Comment_ScreenState extends State<Comment_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Image.asset(Img.x_image,height: 20,width: 20,), onPressed: (){}),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Comment",
          style: TextStyle(color: Colors.purple[500]),
        ),
      ),
      body: Container(
        height: Comman.displaySize(context).height,
        width: Comman.displaySize(context).width,
        color: Colors.white,
          child: LayoutBuilder(builder: (context , constrains){
            return Column(
              children:[
                Container(
                  height: constrains.maxHeight*1,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Comment.Comment_list_items.length,
                        itemBuilder: (context, index){
                          return CommentChildWidget(commentData: Comment.Comment_list_items[index],);
                        }),
                  ),
                ),
              ],
            );
          })
        ),
    );
  }
}
