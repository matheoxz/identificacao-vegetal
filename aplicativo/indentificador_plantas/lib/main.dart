import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'camera_screen.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.lightGreen[900]));
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightGreen[900],
          accentColor: Colors.lightGreen[900]),
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}
