import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int indexPerguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int pontuacao) responder;

  Questionario({
    required this.indexPerguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  bool get _temPerguntaSelecionada {
    return indexPerguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respsList = _temPerguntaSelecionada
        ? perguntas[indexPerguntaSelecionada].cast()["respostas"]
        : [];

    return Column(
      children: [
        Questao(perguntas[indexPerguntaSelecionada]["pergunta"].toString()),
        ...respsList.map(
          (resp) => Resposta(
            resp['texto'].toString(),
            (() => responder(int.parse(resp['nota'].toString()))),
          ),
        ),
      ],
    );
  }
}
