class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);

  String toString() {
    return 'Transferencia{ Valor: $valor, numConta: $numConta }';
  }
}