import 'package:patitas/adaptadores/usuario.dart';

abstract class RepositorioUsuarios {
  void guardaDatosMemoria(Usuario newUsuario);
  List<Usuario> devolverLista();
}
