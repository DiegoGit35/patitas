// ignore_for_file: use_super_parameters

import '../../domain/entities/usuario.dart';
import '../../domain/enums/estado_de_caso.dart';
import '../../domain/enums/tipo_de_caso.dart';

class CasoModel {
  late Usuario? usuarioAdoptante;
  late Usuario usuarioRegistrante;
  late String direccion, distrito, contacto;
  late String? fechaBaja, fechaRegistro;
  late TipoDeCaso tipoDeCaso;
  late EstadoDeCaso estado;
  late int? idCaso;

  CasoModel({
    required idCaso,
    required direccion,
    required distrito,
    required contacto,
    required tipoDeCaso,
    required fechaRegistro,
    required EstadoDeCaso estadoDeCaso,
    required usuarioRegistrante,
    usuarioAdoptante,
    fechaBaja,
  });

  factory CasoModel.fromSqfliteDatabase(Map<String, dynamic> casoBuscado) {
    final model = CasoModel(
      idCaso: casoBuscado['id_caso'],
      direccion: casoBuscado['direccion'],
      distrito: casoBuscado['distrito'],
      contacto: casoBuscado['contacto'],
      fechaRegistro: casoBuscado['fechaRegistro'],
      fechaBaja: casoBuscado['fechaBaja'],
      estadoDeCaso: estadoDeCasoFromInt(casoBuscado['estado']),
      tipoDeCaso: tipoDeCasoFromInt(casoBuscado['tipo_caso']),
      usuarioRegistrante: casoBuscado['usuario_buscado'],
      usuarioAdoptante: casoBuscado['usuario_adoptante'],
    );

    return model;
  }
}

EstadoDeCaso estadoDeCasoFromInt(int estado) {
  switch (estado) {
    case 0:
      return EstadoDeCaso.pendiente;
    case 1:
      return EstadoDeCaso.adoptado;
    case 2:
      return EstadoDeCaso.enTransito;
    default:
      throw Exception('Estado de caso no válido: $estado');
  }
}

TipoDeCaso tipoDeCasoFromInt(int tipo) {
  switch (tipo) {
    case 0:
      return TipoDeCaso.adopcion;
    case 1:
      return TipoDeCaso.transito;
    case 2:
      return TipoDeCaso.busqueda;
    default:
      throw Exception('Tipo de caso no válido: $tipo');
  }
}
