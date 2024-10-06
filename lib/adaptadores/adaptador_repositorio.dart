import 'package:patitas/adaptadores/repositorio.dart';
import 'package:patitas/adaptadores/usuario.dart';

class AdaptadorRepositorio extends RepositorioUsuarios {
  List<Usuario> listaUsuario = [];

  @override
  List<Usuario> devolverLista() {
    return listaUsuario;
  }

  @override
  void guardaDatosMemoria(Usuario newUsuario) {
    listaUsuario.add(newUsuario);
  }
}
