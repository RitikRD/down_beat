import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class CommentChildWidget extends StatelessWidget {
  var commentData;

  CommentChildWidget({Key key, this.commentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Comman.displaySize(context).height * 0.18,
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(builder: (context, constrains) {
        return Container(
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(commentData['picture'] != null
                    ? commentData['picture']
                    : ''),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          commentData['name'] != null
                              ? commentData['name']
                              : '',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.black54),
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite,color: Colors.purple[500],),
                            Icon(Icons.flag,color: Colors.grey,)
                          ],
                        ),
                      ],
                    ),
                    RatingBar.readOnly(
                      size: 20.0,
                      filledColor: Colors.yellow[600],
                      emptyColor: Colors.yellow[600],
                      initialRating: 5,
                      halfFilledIcon: Icons.star_half,
                      isHalfAllowed: true,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                    ),
                    Text(
                      commentData['comment'] != null
                          ? commentData['comment']
                          : '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,),
                  Text(
                    commentData['time'] != null
                        ? commentData['time']
                        : '',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
