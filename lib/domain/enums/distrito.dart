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
      case Distrito.chilecito:
        return "Chilecito";
      case Distrito.eugenioBustos:
        return "Eugenio Bustos";
      case Distrito.laConsulta:
        return "La Consulta";
      case Distrito.pareditas:
        return "Pareditas";
      case Distrito.villaSanCarlos:
        return "Villa San Carlos";
      default:
        return name;
    }
  }
}