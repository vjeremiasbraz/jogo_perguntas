import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    // Cadastrado uma variável do tipo String para receber as perguntas
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
          'Preto',
          'Azul',
          'Vermelho',
          'Verde',
        ],
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': [
          'Cão',
          'Gato',
          'Galinha',
          'Anta',
        ],
      },
      {
        'texto': 'Qual seu nome favorito?',
        'respostas': [
          'Maria',
          'José',
          'Vinicius',
          'Thamirys',
        ],
      },
      {
        'texto': 'Qual seu time favorito?',
        'respostas': [
          'Plameiras',
          'Corinthians',
          'Flamengo',
          'São Paulo',
        ],
      },
      {
        'texto': 'Qual sua cidade de Nascimento?',
        'respostas': [
          'Avaré',
          'SP',
          'Curitiba',
          'SJP',
        ],
      }
    ];
    //Criado uma lista de widget com as respostas e vetor vazio para recebe-las

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets =
        respostas.map((item) => Resposta(item, _responder)).toList();

    /*
    // For passando pelas perguntas
    for (String textoResp in respostas) {
      widgets.add(Resposta(textoResp, _responder));
    }
    */

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
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            // Utilização do spread (... que basicamente junta os resultados anteriores)
            ...respostas.map((item) => Resposta(item, _responder)).toList(),

            // Criado 3 botões de resposta
            /*
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
            ),
            RaisedButton(child: Text('Resposta 2'), onPressed: _responder
                // POderia ser usado desta forma direta
                // { print('Resposta 2 foi selecionada');},
                ),
            RaisedButton(child: Text('Resposta 3'), onPressed: _responder
                // Pode ser passado com arrowfunction
                //() => print('Resposta 3 foi selecionada'),
                ),
                */
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
