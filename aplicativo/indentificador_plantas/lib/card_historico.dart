import 'package:flutter/material.dart';
import 'package:identificador_plantas/helpers/database_helper.dart';

///Classe que dá origem ao cards contidos no histórico. Como essa classe é do tipo StatefulWidget, é
///necessário que a classe State seja definida separadamente e adicionada a essa classe.
class CardHistorico extends StatefulWidget {
  final int idPlanta;
  final DateTime data;

  CardHistorico({
    @required this.idPlanta,
    @required this.data,
  });

  @override
  _CardHistoricoState createState() =>
      _CardHistoricoState(idPlanta: idPlanta, data: data);
}

///Classe de origem ao estado atribuído na classe "CardHistorico". Nela, são mostradas as informações contidas em cada Card do histórico
class _CardHistoricoState extends State<CardHistorico> {
  final int idPlanta;
  final DateTime data;
  final dbHelper = DatabaseHelper.instance;
  String nomePlanta;
  String img;

  _CardHistoricoState({
    @required this.idPlanta,
    @required this.data,
  });
  @override
  void initState() {
    returnNomePlanta().then((result) {
      setState(() {
        nomePlanta = result[0]['nome'];
      });
    });
    returnImagemPlanta().then((value) {
      setState(() {
        img = value[0]['imagem'];
      });
    });
  }

  Future<List<Map<String, dynamic>>> returnNomePlanta() async {
    return await dbHelper.idPlantaToNomePlanta(idPlanta);
  }

  Future<List<Map<String, dynamic>>> returnImagemPlanta() async {
    return await dbHelper.idPlantaToImagePlanta(idPlanta);
  }

  ///Método build da classe, retorna o Card com as informações sobre o nome da planta, uma imagem dela e
  ///a data com o horário da identificação realizada anteriormente.
  @override
  Widget build(BuildContext context) {
    if (nomePlanta == null || img == null) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    }
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: Colors.lightGreen[200],
          child: Container(
            width: double.infinity,
            height: 120,
            child: Row(
              children: [
                //Local de definição da imagem que aparece no card
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Image.asset(img),
                ),
                //Container em que são definidas as informações que aparecem ao lado da imagem da planta identificada anteriormente
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Widget de definição do texto do nome da planta
                      Text(
                        nomePlanta,
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      //Widget de definição da data da identificação
                      Text(
                          '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}'),

                      //Widget de definição do horário da identificação
                      Text(
                          '${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}')
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            //TODO: função de clique no card
          },
        ),
      ),
    );
  }
}
