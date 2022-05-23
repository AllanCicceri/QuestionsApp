import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntasApp());

class _PerguntasAppState extends State<PerguntasApp> {
  int _indexPerguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "pergunta": "Qual sua cor favorita?",
      "respostas": [
        {'texto': 'Amarelo', 'nota': 5},
        {'texto': 'Roxo', 'nota': 2},
        {'texto': 'Preto', 'nota': 3},
        {'texto': 'Azul', 'nota': 8},
      ],
    },
    {
      "pergunta": "Prefere cães ou gatos?",
      "respostas": [
        {'texto': 'Cães', 'nota': 5},
        {'texto': 'Gatos', 'nota': 7},
        {'texto': 'Ambos', 'nota': 10},
        {'texto': 'Nenhum', 'nota': 1},
      ],
    },
    {
      "pergunta": "Qual sua linguagem favorita?",
      "respostas": [
        {'texto': 'Javascript', 'nota': 7},
        {'texto': 'Java', 'nota': 2},
        {'texto': 'Python', 'nota': 4},
        {'texto': 'C#', 'nota': 6},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _indexPerguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _indexPerguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _restartQuestionary() {
    setState(() {
      _indexPerguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    var questionario = Questionario(
      indexPerguntaSelecionada: _indexPerguntaSelecionada,
      perguntas: _perguntas,
      responder: _responder,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? questionario
            : Resultado(_pontuacaoTotal, _restartQuestionary),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}
