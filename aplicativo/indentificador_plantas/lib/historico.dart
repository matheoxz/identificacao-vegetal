import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:identificador_plantas/card_historico.dart';

import 'package:identificador_plantas/helpers/database_helper.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> historico;
  List<CardHistorico> cards = [];

  @override
  void initState() {
    returnObservacoes().then((results) {
      setState(() {
        historico = results;
      });
    });
  }

  Future<List<Map<String, dynamic>>> returnObservacoes() async {
    return await dbHelper.observacoes();
  }

  void returnListCards() {
    for (final i in historico) {
      print(i);
      cards.add(new CardHistorico(
        idPlanta: i['id_planta'],
        data: DateTime.parse(i['data_hora']),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (historico == null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    } else if (historico.length == 0) {
      return Scaffold(
          appBar: AppBar(
            title: Text(':('),
            centerTitle: true,
            automaticallyImplyLeading: true,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Você ainda não identificou nenhuma planta',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: Icon(
                    Elusive.leaf,
                    color: Colors.lightGreen[300],
                    size: 100,
                  ),
                ),
              ],
            ),
          ));
    } else {
      returnListCards();
      return Scaffold(
        appBar: AppBar(
          title: Text('Histórico de Identificação'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          bottom: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //TODO: função de buscar no historico
                  })
            ],
            title: Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Pesquisar',
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45)))),
              ),
            ),
          ),
        ),
        body: ListView(
          children: cards,
        ),
      );
    }
  }
}
