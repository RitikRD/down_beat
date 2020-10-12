import 'package:down_beat/Screens/login_screen.dart';
import 'package:down_beat/Screens/map_place_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/band_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(163,35,165 ,1.0),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_screen(),
    );
  }
}

