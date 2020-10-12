import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comman{

  //Sizebox for width
  static Widget sizeBoxwidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget sizeBoxheight(double height) {
    return SizedBox(
      height: height,
    );
  }
  static Size displaySize(BuildContext context) {
    //debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  static double displayHeight(BuildContext context) {
    // debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  static double displayWidth(BuildContext context) {
    //debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  //Loading indicator
  static Widget loadingIndicator(Color color) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Container(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color,
                  ),
                ),
              )),
        ]);
  }
}