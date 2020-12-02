import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:identificador_plantas/helpers/database_helper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:carousel_pro/carousel_pro.dart';

///Classe que dá origem à janela acessada quando a planta pôde ser identificada pelo aplicativo. Como essa classe é do tipo StatefulWidget, é
///necessário que a classe State seja definida separadamente e adicionada a essa classe.
class Identificada extends StatefulWidget {
  final double porcentagem;
  final int idPlanta;

  Identificada({this.porcentagem, this.idPlanta});

  @override
  _IdentificadaState createState() =>
      _IdentificadaState(porcentagem: porcentagem, idPlanta: idPlanta);
}

///Classe de origem ao estado atribuído na classe "Identificada". Nela, são mostradas informações como:
///- Um conjunto de imagens da planta identificada contida no banco de dados do app;
///- A classificação de ser comestível ou não;
///- O nome da planta identificada;
///- Uma breve descrição da planta identificada;
///- A probabilidade (em porcentagem) da planta identificada pelo app for a planta que o usuário enviou
///- Duas opções para o usuário escolher se as fotos correspondem à planta que ele enviou
class _IdentificadaState extends State<Identificada> {
  final double porcentagem;
  final int idPlanta;
  bool nome = false, img = false;

  String nomePlanta, categoria, descricao;
  List<ExactAssetImage> imagens = [];

  final dbHelper = DatabaseHelper.instance;
  _IdentificadaState({this.porcentagem, this.idPlanta});

  @override
  void initState() {
    returnNomePlanta().then((result) {
      setState(() {
        nomePlanta = result[0]['nome'];
        categoria = result[0]['categoria'];
        descricao = result[0]['descricao'];
        nome = true;
      });
    });
    returnImagemPlanta().then((result) {
      setState(() {
        for (final i in result) {
          imagens.add(ExactAssetImage(i['imagem']));
          img = true;
        }
        print(imagens);
      });
    });
  }

  /// retorna o nome da planta cujo id é igual ao idPlanta
  Future<List<Map<String, dynamic>>> returnNomePlanta() async {
    return await dbHelper.idPlantaToNomePlanta(idPlanta);
  }

  /// retorna a primeira imagem da planta
  Future<List<Map<String, dynamic>>> returnImagemPlanta() async {
    return await dbHelper.idPlantaToImagePlanta(idPlanta);
  }

  ///Método build da classe, retorna a tela desejada com as informações descritas na definição dessa classe.
  @override
  Widget build(BuildContext context) {
    if (nome && img) {
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
              //Box referente ao Carrosel que contém o conjunto de imagens da planta identificada
              SizedBox(
                height: 250,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  dotSize: 4,
                  dotBgColor: Colors.white.withOpacity(0),
                  images: imagens,
                ),
              ),

              //Container em que aparece a Categoria da planta identificada
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

              //Container em que aparece o nome da planta identificada
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  nomePlanta,
                  style: TextStyle(fontSize: 40),
                ),
              ),

              //Container em que aparece a descrição da planta identificada
              Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  descricao,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              )
            ],

            //Rodapé que contém a probabilidade de acerto da identificação e as opções "sim" ou "não", referentes à pergunta "As fotos correspondem à planta?".
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
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    }
  }
}
