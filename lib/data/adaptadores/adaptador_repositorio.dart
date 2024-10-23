import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/domain/entities/fecha.dart';
import 'package:patitas/domain/entities/usuario.dart';

import 'package:patitas/data/repositorio/repositorio.dart';
import 'package:patitas/domain/enums/distrito.dart';

import 'package:patitas/presentation/widgets/imagenes.dart';

class AdaptadorRepositorio extends RepositorioUsuarios {
  List<Usuario> listaUsuario = [
    Usuario(
        nombre: "Agustin",
        apellido: "Zapata",
        sexo: "Masculino",
        fechaNacimiento: DateTime.now(),
        email: "agus@gmail.com",
        contrasenia: "agus123",
        direccion: "mi casa 123",
        distrito: "${Distrito.laConsulta}",
        telefono: "2764736478124")
  ];

  List<Caso> listaAnimales = [];

  @override
  List<Usuario> devolverLista() {
    return listaUsuario;
  }

  @override
  void guardaDatosMemoria(Usuario newUsuario) {
    listaUsuario.add(newUsuario);
  }
}
