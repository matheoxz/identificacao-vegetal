import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:identificador_plantas/helpers/database_helper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Identificada extends StatefulWidget {
  final double porcentagem;
  final int idPlanta;

  Identificada({this.porcentagem, this.idPlanta});

  @override
  _IdentificadaState createState() =>
      _IdentificadaState(porcentagem: porcentagem, idPlanta: idPlanta);
}

class _IdentificadaState extends State<Identificada> {
  final double porcentagem;
  final int idPlanta;

  String nomePlanta, categoria, descricao;
  List<Image> imagens = [];

  final dbHelper = DatabaseHelper.instance;
  _IdentificadaState({this.porcentagem, this.idPlanta});

  @override
  void initState() {
    returnNomePlanta().then((result) {
      setState(() {
        nomePlanta = result[0]['nome'];
        categoria = result[0]['categoria'];
        descricao = result[0]['descricao'];
      });
    });
    returnImagemPlanta().then((result) {
      setState(() {
        for (final i in result) {
          imagens.add(Image.asset(i['imagem']));
        }
        ;
      });
    });
  }

  Future<List<Map<String, dynamic>>> returnNomePlanta() async {
    return await dbHelper.idPlantaToNomePlanta(idPlanta);
  }

  Future<List<Map<String, dynamic>>> returnImagemPlanta() async {
    return await dbHelper.idPlantaToImagePlanta(idPlanta);
  }

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
          flex: 10,
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: Carousel(
                dotSize: 4,
                dotBgColor: Colors.white.withOpacity(0),
                images: imagens,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Wrap(
                spacing: 20,
                children: [
                  Chip(
                    label: Text(
                      categoria,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.lightGreen[600],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                nomePlanta,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                descricao,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            )
          ],
          footer: Footer(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Spacer(),
                    LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 25.0,
                      percent: porcentagem,
                      animationDuration: 2500,
                      animation: true,
                      center: Text(
                        '${porcentagem * 100}%',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.lightGreen[900],
                      progressColor: Colors.lightGreen[600],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Probabilidade de Acerto')),
                    Spacer(),
                  ],
                ),
                Column(
                  children: [
                    Spacer(),
                    Text('As fotos correspondem à planta?'),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.lightGreen[600],
                              child: Text(
                                'Sim',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                //TODO: função imagem corresponde
                              }),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Text('Não'),
                              onPressed: () {
                                //TODO: função não corresponde
                              })
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
