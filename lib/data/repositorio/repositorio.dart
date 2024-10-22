import 'package:patitas/domain/entities/usuario.dart';

abstract class RepositorioUsuarios {
  void guardaDatosMemoria(Usuario newUsuario);
  List<Usuario> devolverLista();
}
