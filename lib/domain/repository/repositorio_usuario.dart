import '../entities/usuario.dart';

abstract class RepositorioUsuario {
  void agregarUsuario(Usuario nuevoUsuario);
  void bajarUsuario(int usuarioId);
  Future<List<Usuario>> todosLosUsuarios();
  Future<List<Usuario>> todosLosUsuariosActivos();
  Future<Usuario> getUsuarioById(int usuarioId);
  Future<bool> getUsuarioByEmail(String email);
  Future<bool> getUsuarioByTelefono(String email);
}
