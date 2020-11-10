import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:identificador_plantas/card_historico.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
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
        children: [
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
          CardHistorico(
            nomePlanta: 'Ora-pro-nóbis',
            data: DateTime.utc(2020, 11, 3, 12, 00),
          ),
        ],
      ),
    );
  }
}
