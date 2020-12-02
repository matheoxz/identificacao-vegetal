import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:identificador_plantas/card_historico.dart';

import 'package:identificador_plantas/helpers/database_helper.dart';

///Widget que gera a página de histórico de observações, deve puxar todas as observações do banco de dados e mostrar em cards.
///Performa pesquisa das observações no banco de dados.
///Ao clicar no card se é redirecionado à página da planta, com suas informações.
class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  //instancia do Banco de Dados
  final dbHelper = DatabaseHelper.instance;
  //lista que armazena os resultados do BD
  List<Map<String, dynamic>> historico;
  //lista dos cards que serão mostrados
  List<CardHistorico> cards = [];

  /// Inicia o estado do Widget, puxando todas as observações do BD
  @override
  void initState() {
    returnObservacoes().then((results) {
      setState(() {
        historico = results;
      });
    });
  }

  /// função responsável por puxar todas as observações do BD
  Future<List<Map<String, dynamic>>> returnObservacoes() async {
    return await dbHelper.observacoes();
  }

  /// função que preence a lista de cards com os dados do BD
  void returnListCards() {
    for (final i in historico) {
      print(i);
      cards.add(new CardHistorico(
        idPlanta: i['id_planta'],
        data: DateTime.parse(i['data_hora']),
      ));
    }
  }

  /// método de construção do widget
  @override
  Widget build(BuildContext context) {
    //aguarda que o BD retorne os resultados, enquanto não chegarem mostra que está carregando
    if (historico == null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
      // Se não houverem observações ainda, mostra uma página dizendo que aindão foi identificada nenhuma planta
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
      //caso hajam observações registradas, mostra a barra de pesquisa e os cards.
    } else {
      //carrega a lista dos cards
      returnListCards();
      return Scaffold(
        appBar: AppBar(
          title: Text('Histórico de Identificação'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          bottom: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              //botão de busca
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
              //barra de pesquisa
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
          //mostra os cards
          children: cards,
        ),
      );
    }
  }
}
