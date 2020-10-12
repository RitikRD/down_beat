import 'package:down_beat/utils/img.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Color toolbarColor;

  CustomAppBar({
    @required this.title,
    @required this.toolbarColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(163,35,165 ,1.0),
          title: Text(
            title,
            style: titlTextStyle,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 5,right: 8.0),
              height: MediaQuery.of(context).size.height * 0.032,
              width: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                borderRadius: BorderRadius.circular(1000.0),
              ),
                  child: IconButton(
                    iconSize: 40.0,
                  onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                  },
                  icon: Image.asset(Img.appbar_button_img,),
                  color: Colors.white),
                )
          ],
        ),
    );
  }
  TextStyle titlTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 26.0,
  );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
