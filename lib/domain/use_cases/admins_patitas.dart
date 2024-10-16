import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/fecha.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/config/routes/routes.dart';

import '../entities/caso.dart';

class AdminsPatitas {
  String registrarse(String nombre, String apellido, String telefonoOEmail,
      String password, DateTime fechaNa, String genero) {
    int yearMax = 2023 - 18;
    if (nombre.isEmpty ||
        apellido.isEmpty ||
        telefonoOEmail.isEmpty ||
        password.isEmpty ||
        genero.isEmpty) {
      return "casillas";
    }

    if (fechaNa.year >= yearMax) {
      return "year";
    }

    // if (int.parse(year) > yearPermitido) {
    //   return "year";
    // }

    for (Usuario unUsuario in adaptador.listaUsuario) {
      if (unUsuario.telefonoOEmail == telefonoOEmail) {
        return "registrados";
      }
    }

    Fecha fechaNacimiento =
        Fecha(dia: fechaNa.day, mes: fechaNa.month, year: fechaNa.year);
    Usuario newUsuario = Usuario(
        nombre: nombre,
        apellido: apellido,
        telefonoOEmail: telefonoOEmail,
        password: password,
        fechaNacimiento: fechaNacimiento,
        genero: genero);
    adaptador.guardaDatosMemoria(newUsuario);
    return "bien";
  }

  void iniciarSesion(context) {
    cambiarPantalla("menu", context);
  }

  void adoptar() {}

  void transitar() {}

  registrarNuevoCaso() {}

  registrarResolucionDeCaso(Caso caso, Usuario usuarioAdoptante) {}

  getCasosDeAdopcionNoResueltos() {}

  getCasosDeAdopcionResueltos() {}

  getCasosDeTransitoResueltos() {}
}
