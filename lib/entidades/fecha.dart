class Fecha {
  int dia;
  int mes;
  int year;
  Fecha({required this.dia, required this.mes, required this.year});

  @override
  String toString() {
    return "$dia/$mes/$year";
  }
}
