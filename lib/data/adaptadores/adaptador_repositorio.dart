import 'package:patitas/entidades/fecha.dart';
import 'package:patitas/data/repositorio/repositorio.dart';
import 'package:patitas/entidades/usuario.dart';

class AdaptadorRepositorio extends RepositorioUsuarios {
  List<Usuario> listaUsuario = [
    Usuario(
        nombre: "a",
        apellido: "a",
        telefonoOEmail: "admin",
        password: "admin",
        fechaNacimiento: Fecha(dia: 2, mes: 2, year: 2),
        genero: "mate")
  ];

  @override
  List<Usuario> devolverLista() {
    return listaUsuario;
  }

  @override
  void guardaDatosMemoria(Usuario newUsuario) {
    listaUsuario.add(newUsuario);
  }
}
