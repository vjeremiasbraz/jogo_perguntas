import 'package:flutter/material.dart';

main() => runApp(new PerguntaApp());

class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cadastrado uma variável do tipo String para receber as perguntas
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é seu animal favorito?',
    ];

    // Colocando o return usando o padrão em MaterialAPP
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jogo das Perguntas'),
        ),
        body: Column(
          //Colocado children com tipo Widgets
          children: <Widget>[
            // Passado a pergunta no texto
            Text(perguntas[0]),
            // Criado 3 botões de resposta
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
