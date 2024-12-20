import '../entities/usuario.dart';

abstract class RepositorioUsuario {
  void agregarUsuario(Usuario nuevoUsuario);
  void bajarUsuario(String usuarioId);
  void activarUsuario(String usuarioId);
  Future<List<Usuario>> todosLosUsuarios();
  Future<List<Usuario>> todosLosUsuariosActivos();
  Future<Usuario> getUsuarioById(String usuarioId);
  Future<bool> usuarioExiste({String? email, String? telefono});
  Future<Usuario> getUsuarioByEmail(String numeroEmail);
}
