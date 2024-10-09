import 'package:patitas/data/data_sources/database_helper.dart';

import '../../domain/entities/caso.dart';
import '../../domain/enums/estado_de_caso.dart';
import '../../domain/enums/tipo_de_caso.dart';
import '../../domain/repository/repositorio_caso.dart';
import '../models/caso_model.dart';
import '../models/usuario_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class RepositorioCasoImpl implements RepositorioCaso {
  DatabaseHelper helper = DatabaseHelper.instance;

  @override
  void agregarCaso(Caso nuevoCaso) async {
    final db = await helper.database;

    int estadoInt = estadoDeCasoToInt(EstadoDeCaso.pendiente);
    int tipoInt = tipoDeCasoToInt(TipoDeCaso.adopcion);

    if (db != null) {
      await db.rawInsert(
          'INSERT INTO caso (direccion, distrito, contacto, tipo_caso, estado, usuario_registrante, ) '
          'VALUES (?, ?, ?, ?, ?, ?)',
          [
            nuevoCaso.direccion,
            nuevoCaso.distrito,
            nuevoCaso.contacto,
            tipoInt,
            estadoInt,
            nuevoCaso.usuarioRegistrante.idUsuario,
          ]);
    } else {
      print("No se pudo obtener la instancia de la base de datos.");
    }
  }

  @override
  void bajarCaso(int id) async {
    final db = await helper.database;
    if (db != null) {
      await db.rawInsert(
          '''INSERT INTO caso(fecha_baja) VALUES (CURRENT_DATE) WHERE id_caso = (?)''',
          [id]);
    } else {
      print("No se pudo obtener la instancia de la base de datos.");
    }
  }

  @override
  Future<CasoModel?> getCasoPorId(int id) async {
    final db = await helper.database;

    // UsuarioModel usuarioRegistrante = await buscarUsuarioRegistrante(db, id);

    // UsuarioModel usuarioAdoptante = await buscarUsuarioAdoptante(db, id);

    final List<Map<String, Object?>> casoBuscado = await db!
        .rawQuery('''SELECT * FROM usuario WHERE id_caso = (?);''', [id]);

    List<CasoModel> casoEncontrado = casoBuscado.map((casoDesdeDB) {
      return CasoModel.fromSqfliteDatabase(casoDesdeDB);
    }).toList();
    // casoEncontrado[0].usuarioAdoptante = usuarioAdoptante;
    return casoEncontrado[0];
  }

  Future<UsuarioModel> buscarUsuarioAdoptante(Database? db, int id) async {
    final List<Map<String, Object?>> usuarioAdoptanteBuscado =
        await db!.rawQuery('''SELECT u.*
FROM usuario u
JOIN caso c ON u.id_usuario = c.usuario_registrante
WHERE c.id_caso = (?);''', [id]);

    List<UsuarioModel> usuarioAdoptante =
        usuarioAdoptanteBuscado.map((usuarioDesdeDB) {
      return UsuarioModel.fromSqfliteDatabase(usuarioDesdeDB);
    }).toList();
    return usuarioAdoptante[0];
  }

  Future<UsuarioModel> buscarUsuarioRegistrante(Database? db, int id) async {
    final List<Map<String, Object?>> usuarioBuscado =
        await db!.rawQuery('''SELECT u.*
FROM usuario u
JOIN caso c ON u.id_usuario = c.usuario_registrante
WHERE c.id_caso = (?);''', [id]);

    List<UsuarioModel> usuarioRegistrante =
        usuarioBuscado.map((usuarioDesdeDB) {
      return UsuarioModel.fromSqfliteDatabase(usuarioDesdeDB);
    }).toList();
    return usuarioRegistrante[0];
  }

  @override
  Future<List<CasoModel>> todosLosCasos() async {
    final db = await helper.database;

    final List<Map<String, dynamic>> todosLosCasos = await db!.rawQuery('''
      SELECT * FROM caso;''');

    List<CasoModel> casos = todosLosCasos.map((caso) {
      return CasoModel.fromSqfliteDatabase(caso);
    }).toList();

    return casos;
  }

  @override
  Future<List<CasoModel>> todosLosCasosPendientes() async {
    final db = await helper.database;

    final List<Map<String, dynamic>> todosLosCasos = await db!.rawQuery('''
      SELECT * FROM caso WHERE estado = 1;''');

    List<CasoModel> casos = todosLosCasos.map((caso) {
      return CasoModel.fromSqfliteDatabase(caso);
    }).toList();

    return casos;
  }
}

int tipoDeCasoToInt(TipoDeCaso tipo) {
  switch (tipo) {
    case TipoDeCaso.adopcion:
      return 0;
    case TipoDeCaso.transito:
      return 1;
    case TipoDeCaso.busqueda:
      return 2;
    default:
      throw Exception('Tipo de caso no válido: $tipo');
  }
}

int estadoDeCasoToInt(EstadoDeCaso estado) {
  switch (estado) {
    case EstadoDeCaso.pendiente:
      return 0;
    case EstadoDeCaso.adoptado:
      return 1;
    case EstadoDeCaso.enTransito:
      return 2;
    default:
      throw Exception('Estado de caso no válido: $estado');
  }
}
