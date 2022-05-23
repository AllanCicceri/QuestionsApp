import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _resposta;
  final void Function() _whenSelected;

  const Resposta(this._resposta, this._whenSelected);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _whenSelected,
      child: Text(_resposta),
    );
  }
}
