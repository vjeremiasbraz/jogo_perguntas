import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Cão', 'pontuacao': 5},
        {'texto': 'Gato', 'pontuacao': 3},
        {'texto': 'Galinha', 'pontuacao': 0},
        {'texto': 'Anta', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual seu nome favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 0},
        {'texto': 'José', 'pontuacao': 5},
        {'texto': 'Vinicius', 'pontuacao': 3},
        {'texto': 'Thamirys', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual seu time favorito?',
      'respostas': [
        {'texto': 'Palmeiras', 'pontuacao': 5},
        {'texto': 'Corinthians', 'pontuacao': 10},
        {'texto': 'Flamengo', 'pontuacao': 3},
        {'texto': 'São Paulo', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual sua cidade de Nascimento?',
      'respostas': [
        {'texto': 'RJ', 'pontuacao': 3},
        {'texto': 'SP', 'pontuacao': 10},
        {'texto': 'Curitiba', 'pontuacao': 0},
        {'texto': 'SJP', 'pontuacao': 5},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Cadastrado uma variável do tipo String para receber as perguntas

    //Criado uma lista de widget com as respostas e vetor vazio para recebe-las
/*
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];
*/
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
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
