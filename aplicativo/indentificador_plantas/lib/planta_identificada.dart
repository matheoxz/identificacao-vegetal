import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Identificada extends StatefulWidget {
  final double porcentagem;

  Identificada({this.porcentagem});

  @override
  _IdentificadaState createState() =>
      _IdentificadaState(porcentagem: porcentagem);
}

class _IdentificadaState extends State<Identificada> {
  final double porcentagem;
  _IdentificadaState({this.porcentagem});
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
                images: [
                  NetworkImage(
                      'https://conteudo.imguol.com.br/blogs/221/files/2020/03/iStock-1195760577.jpg'),
                  NetworkImage(
                      'https://www.manacapaisagismo.com.br/wp-content/uploads/2018/05/ora-pro-nobis.jpg'),
                  NetworkImage(
                      'https://conteudo.imguol.com.br/c/entretenimento/85/2020/08/28/ora-pro-nobis-1598644031343_v2_450x337.jpg'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Wrap(
                spacing: 20,
                children: [
                  Chip(
                    label: Text(
                      'Comestível',
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
                'Ora-pró-nobis',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                '''Pereskia aculeata, popularmente conhecida como ora-pro-nóbis (do latim ora pro nobis: 'ora por nós'), orabrobó, lobrobó ou lobrobô, é uma cactácea trepadeira folhosa. É uma planta bastante rara, rústica, perene, desenvolvendo-se bem em vários tipos de solo, tanto à sombra como ao sol. Muito usada em cercas vivas, mas suas folhas e frutos, que são bagas amarelas e redondas, também servem como alimento.[2] A planta é também empregada para a produção de mel.[3][4]

É originária do continente americano, onde tem ampla distribuição - desde o sul dos Estados Unidos até a Argentina, passando pelas ilhas do Caribe. Planta perene, rústica e resistente à seca, é a única espécie do gênero Pereskia que tem hábito de liana. No Brasil, ocorre em florestas perenifólias, nos estados de Maranhão, Ceará, Pernambuco, Alagoas, Sergipe, Bahia, Minas Gerais, Espírito Santo e Rio de Janeiro.[5]

A denominação do gênero Pereskia refere-se ao botânico francês Nicolas-Claude Fabri de Peiresc, e o termo aculeata (do latim ăcŭlĕus, 'agulha' ou 'espinho') significa dotado de espinhos. Já o nome popular da planta, segundo a tradição, teria sido criado por pessoas que colhiam suas folhas no quintal de um padre, enquanto este rezava uma ladainha, cujo refrão, Ora pro nobis, era repetido a cada invocação.''',
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
