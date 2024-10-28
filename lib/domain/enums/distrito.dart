enum Distrito {
  laConsulta,
  eugenioBustos,
  villaSanCarlos,
  chilecito,
  pareditas,
}

extension DistritoExtension on Distrito {
  String get formattedName {
    switch (this) {
      case Distrito.laConsulta:
        return "La Consulta";
      case Distrito.eugenioBustos:
        return "Eugenio Bustos";
      case Distrito.villaSanCarlos:
        return "Villa San Carlos";
      case Distrito.chilecito:
        return "Chilecito";
      case Distrito.pareditas:
        return "Pareditas";
      default:
        return name;
    }
  }
}