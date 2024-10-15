import 'package:patitas/entidades/usuario.dart';

abstract class RepositorioUsuarios {
  void guardaDatosMemoria(Usuario newUsuario);
  List<Usuario> devolverLista();
}
