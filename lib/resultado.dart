import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 5) {
      return "Puta que pariu, você é ruinzão."
          "\n\nSua pontuação foi $pontuacao.";
    } else if (pontuacao < 15) {
      return "Você tá aprendendo, treine mais."
          "\n\nSua pontuação foi $pontuacao.";
    } else if (pontuacao < 30) {
      return "Você já está muito bom."
          "\n\nSua pontuação foi $pontuacao.";
    } else if (pontuacao < 42) {
      return "Falta pouco pra você jovem."
          "\n\nSua pontuação foi $pontuacao.";
    } else {
      return "Carai, o maluco é brabo!!."
          "\n\nSua pontuação foi $pontuacao.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 20))),
        FlatButton(
          child: Text(
            'Jogar Novamente?',
            style: TextStyle(fontSize: 20),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
