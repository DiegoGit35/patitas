import 'package:patitas/adaptadores/fecha.dart';
import 'package:patitas/adaptadores/repositorio.dart';
import 'package:patitas/adaptadores/usuario.dart';

class AdaptadorRepositorio extends RepositorioUsuarios {
  List<Usuario> listaUsuario = [
    Usuario(
        nombre: "a",
        apellido: "a",
        telefonoOEmail: "123",
        password: "123",
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
