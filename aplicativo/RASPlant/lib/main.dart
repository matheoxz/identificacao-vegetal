import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'camera_screen.dart';

//Inicia o aplicativo chamando a classe Home
void main() => runApp(Home());

/// A classe Home inicia o aplicativo, setando o tema e suas cores, a classe invoca a Classe CameraScreen como Tela Inicial
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.lightGreen[900]));
    return MaterialApp(
      title: "RASPlant",
      theme: ThemeData(
          primaryColor: Colors.lightGreen[900],
          accentColor: Colors.lightGreen[900]),
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}
