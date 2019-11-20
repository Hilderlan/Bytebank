import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumConta,
              dica: '0000',
              rotulo: 'Número da conta',
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: '0.00',
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                final int numConta = int.tryParse(_controladorCampoNumConta.text);
                final double valor = double.tryParse(_controladorCampoValor.text);
                _criaTransferencia(context, numConta, valor);
              },
            )
          ],
        ),
      )
    );
  }
}

void _criaTransferencia(BuildContext context, int numConta, double valor){
  if(numConta != null && valor != null){
    final transferenciaCriada = Transferencia(valor, numConta);
    debugPrint('$transferenciaCriada');
    Navigator.pop(context, transferenciaCriada);
  }
  else {
    debugPrint('Campos preenchidos errados!');
  }
}