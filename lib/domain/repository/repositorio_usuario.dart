import '../../data/models/usuario_model.dart';
import '../entities/usuario.dart';

abstract class RepositorioUsuario {
  Future<List<UsuarioModel>> todosLosUsuarios();

  Future<List<UsuarioModel>> todosLosUsuariosActivos();

  Future<UsuarioModel?> getUsuarioPorId(int id);

  void agregarUsuario(Usuario nuevoUsuario);

  void bajarUsuario(int id);
}
