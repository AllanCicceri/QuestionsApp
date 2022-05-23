import 'package:flutter/widgets.dart';

class Questao extends StatelessWidget {
  final String pergunta;

  const Questao(this.pergunta);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        pergunta,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
