import '../entities/usuario.dart';

abstract class RepositorioUsuario {
  void agregarUsuario(Usuario nuevoUsuario);

  void bajarUsuario(int id);
}
