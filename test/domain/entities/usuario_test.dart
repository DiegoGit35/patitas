import 'package:flutter_test/flutter_test.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/enums/distrito.dart';

void main() {
  String contrasenia = 'servilleta123';

  // final usuario = Usuario(
  //   " roberto   abel",
  //   "CONtreras PEREZ",
  //   "roberto@gmail.com",
  //   contrasenia,
  //   95119392,
  //   "Calle Azul 230",
  //   Distrito.laConsulta,
  //   "2622255423",
  // );

  final usuario = Usuario(
    nombre: " roberto   abel",
    apellido: "CONtreras PEREZ",
    email: "roberto@gmail.com",
    contrasenia: "servilleta123",
    dni: 95119392,
    direccion: "Calle Azul 230",
    distrito: Distrito.chilecito,
    telefono: "2622255423",
  );

  // var usuario = Usuario();

  test('debe formatear el nombre y apellido', () {
    // usuario.nombre = " roberto   abel";
    // usuario.apellido = "CONtreras PEREZ";

    String nombreFormateado = '${usuario.apellido}, ${usuario.nombre}';

    expect(nombreFormateado, "Contreras Perez, Roberto Abel");
  });

  test('debe verificar que la contraseña ingresada este encriptada', () {
    // usuario.contrasenia = 'servilleta123';

    final String hashedConstrasenia = usuario.contrasenia;

    expect(hashedConstrasenia, isNot(contrasenia));
  });

  // test('debe formatear bien la fecha de registro', () {}); esto es parte del model

  test('debe verificar que el mail ingresado tenga un formato valido', () {
    usuario.email = "roberto @gmail.com";
    expect(usuario.email, null);
  });

  // test('debe cargar un objeto usuario', () {}); esto es parte de repository
}
