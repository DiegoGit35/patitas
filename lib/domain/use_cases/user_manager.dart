import 'package:patitas/data/repository_impl/repositorio_usuario_impl.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';
import 'package:patitas/domain/repository/repositorio_usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/usuario.dart';

class SessionManager {
  // Llave para el ID del usuario
  static const String _userIdKey = "user_id";

  // Guardar el ID de usuario en SharedPreferences
  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  // Obtener el ID de usuario de SharedPreferences
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString(_userIdKey));
    return prefs.getString(_userIdKey);
  }

  Future<TipoDeUsuario> getTipoDeUsuario() async {
    RepositorioUsuario repo = RepositorioUsuarioImpl();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(_userIdKey);
    // print(email);
    if (email != null) {
      Usuario? usuario = await repo.getUsuarioByEmail(email);
      return usuario.tipo;
    } else {
      throw Exception(
          "El email del usuario no está disponible en SharedPreferences.");
    }
  }

  // Cerrar sesión eliminando el ID de usuario
  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }

  // Verificar si el usuario está autenticado
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userIdKey);
  }
}
