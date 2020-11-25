import 'package:flutter/material.dart';
import 'package:identificador_plantas/helpers/database_helper.dart';

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

class _CardHistoricoState extends State<CardHistorico> {
  final int idPlanta;
  final DateTime data;
  final dbHelper = DatabaseHelper.instance;
  String nomePlanta;

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
  }

  Future<List<Map<String, dynamic>>> returnNomePlanta() async {
    return await dbHelper.idPlantaToNomePlanta(idPlanta);
  }

  @override
  Widget build(BuildContext context) {
    if (nomePlanta == null) {
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
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Image.network(
                      //TODO: pensar em como pegar a imagem dinamicamente a partir do nome da planta
                      'https://conteudo.imguol.com.br/blogs/221/files/2020/03/iStock-1195760577.jpg'),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nomePlanta,
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Text(
                          '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}'),
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
