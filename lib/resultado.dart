import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() restartQuestionary;

  Resultado(this.pontuacao, this.restartQuestionary);

  String get getResultMsg {
    String msg = "Can\'t calculate...";
    if (pontuacao < 10) {
      msg = "Nice..";
    } else if (pontuacao < 15) {
      msg = "Great!";
    } else if (pontuacao < 18) {
      msg = "Really nice, dude!";
    } else {
      msg = "Wow! You rocked!";
    }

    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(getResultMsg, style: TextStyle(fontSize: 28)),
        ),
        TextButton(
          onPressed: restartQuestionary,
          child: const Icon(
            Icons.refresh,
            size: 20,
          ),
        )
      ],
    );
  }
}
