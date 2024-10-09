import 'package:patitas/data/data_sources/database_helper.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';

import '../../domain/entities/usuario.dart';
import '../models/usuario_model.dart';

class RepositorioUsuarioImpl implements RepositorioUsuario {
  DatabaseHelper helper = DatabaseHelper.instance;

  @override
  void agregarUsuario(Usuario nuevoUsuario) async {
    final db = await helper.database;

    if (db != null) {
      await db.rawInsert(
          'INSERT INTO usuario (nombre, apellido, email, contrasenia, dni, direccion, distrito, telefono) '
          'VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
          [
            nuevoUsuario.nombre,
            nuevoUsuario.apellido,
            nuevoUsuario.email,
            nuevoUsuario.contrasenia,
            nuevoUsuario.dni,
            nuevoUsuario.direccion,
            nuevoUsuario.distrito.toString(),
            nuevoUsuario.telefono
          ]);
    } else {
      print("No se pudo obtener la instancia de la base de datos.");
    }
  }

  @override
  void bajarUsuario(int id) async {
    final db = await helper.database;
    if (db != null) {
      await db.rawInsert(
          '''INSERT INTO caso(fecha_baja) VALUES (CURRENT_DATE) WHERE id_caso = (?)''',
          [id]);
    }
  }

  @override
  Future<UsuarioModel?> getUsuarioPorId(int id) async {
    // TODO: añadir try catch con mensaje de error?
    final db = await helper.database;

    final List<Map<String, Object?>> usuarioBuscado = await db!
        .rawQuery('''SELECT * FROM usuario WHERE id_usuario = (?);''', [id]);

    List<UsuarioModel> usuarioEncontrado = usuarioBuscado.map((usuarioDesdeDB) {
      return UsuarioModel.fromSqfliteDatabase(usuarioDesdeDB);
    }).toList();
    return usuarioEncontrado[0];
  }

  @override
  Future<List<UsuarioModel>> todosLosUsuarios() async {
    final db = await helper.database;

    final List<Map<String, dynamic>> todosLosUsuarios = await db!.rawQuery('''
      SELECT * FROM usuario;''');

    List<UsuarioModel> usuarios = todosLosUsuarios.map((usuario) {
      return UsuarioModel.fromSqfliteDatabase(usuario);
    }).toList();

    return usuarios;
  }

  @override
  Future<List<UsuarioModel>> todosLosUsuariosActivos() async {
    final db = await helper.database;

    final List<Map<String, dynamic>> todosLosUsuarios = await db!.rawQuery('''
      SELECT * FROM usuario WHERE fecha_baja = NULL;''');

    List<UsuarioModel> usuariosActivos = todosLosUsuarios.map((usuario) {
      return UsuarioModel.fromSqfliteDatabase(usuario);
    }).toList();

    return usuariosActivos;
  }
}
