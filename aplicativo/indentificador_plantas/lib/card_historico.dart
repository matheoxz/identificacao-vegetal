import 'package:flutter/material.dart';

class CardHistorico extends StatelessWidget {
  final String nomePlanta;
  final DateTime data;

  CardHistorico({
    @required this.nomePlanta,
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
