import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class Identificada extends StatefulWidget {
  @override
  _IdentificadaState createState() => _IdentificadaState();
}

class _IdentificadaState extends State<Identificada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white38,
          leading: BackButton(
            color: Colors.lightGreen[900],
          ),
        ),
        body: FooterView(
          children: [Text('A')],
          footer: Footer(
            child: Text('A'),
          ),
        ));
  }
}
