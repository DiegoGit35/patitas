enum TipoDeCaso {
  adopcion,
  transito,
  busqueda,
}

extension TipoDeCasoExtension on TipoDeCaso {
  String get formattedName {
    switch (this) {
      case TipoDeCaso.adopcion:
        return "Adopción";
      case TipoDeCaso.transito:
        return "Tránsito";
      case TipoDeCaso.busqueda:
        return "Búsqueda";

      default:
        return name;
    }
  }
}