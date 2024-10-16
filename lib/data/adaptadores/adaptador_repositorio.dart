import 'package:patitas/entidades/animal.dart';
import 'package:patitas/entidades/fecha.dart';
import 'package:patitas/data/repositorio/repositorio.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/presentation/widgets/imagenes.dart';

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

  List<Animal> listaAnimales = [
    Animal(
        foto: imgAnimles[0],
        telefono: "262342",
        ubicacion: "Avenida Siempre Viva 747"),
    Animal(
        foto: imgAnimles[1],
        telefono: "25345",
        ubicacion: "Avenida Siempre Viva 747"),
    Animal(
        foto: imgAnimles[2],
        telefono: "53453636",
        ubicacion: "Avenida Siempre Viva 747"),
    Animal(
        foto: imgAnimles[3],
        telefono: "6345363463",
        ubicacion: "Avenida Siempre Viva 747"),
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
