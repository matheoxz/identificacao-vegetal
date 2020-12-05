import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';

///Classe que da origem à janela acessada pelo usuário quando a planta enviada por ele não pôde ser identificada pelo aplicativo.
class NaoIdentificada extends StatelessWidget {
  ///Método build da classe, retorna a tela de fundo verde com a mensagem centralizada informando ao user que sua planta
  ///não pôde ser identificada. Na parte superior dessa janela, há um pequeno botão de retorno para a página anterior acessada pelo usuário.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.lightGreen[900],
        width: double.infinity,
        height: double.infinity,

        //Local de definição do texto apresentado ao usuário nessa janela
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Desculpe, \n não foi possível identificar a imagem',
              style: TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.all(40),
              child: Icon(
                Elusive.leaf,
                color: Colors.white,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
