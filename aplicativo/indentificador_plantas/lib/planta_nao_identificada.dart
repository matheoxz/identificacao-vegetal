import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';

class NaoIdentificada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.lightGreen[900],
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Desculpe, \n não foi possível identificar a imagem',
              style: TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.all(40),
              child: Icon(
                Elusive.leaf,
                color: Colors.white,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
