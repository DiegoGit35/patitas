import 'package:flutter/material.dart';
import 'package:patitas/data/adaptador.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';
import 'package:patitas/presentation/widgets/imagenes.dart';
import 'package:patitas/presentation/widgets/snakbar.dart';

class Pageiniciosesion extends StatelessWidget {
  const Pageiniciosesion({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numeroCorreoController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void resetAllControllers() {
      numeroCorreoController.clear();
      passwordController.clear();
    }

    void verificarDatos() {
      String numeroCorreo = numeroCorreoController.text;
      String password = passwordController.text;

      String mensaje = adminApp.iniciarSesion(numeroCorreo, password);

      switch (mensaje) {
        case "casillas":
          SnackbarWidget.showSnackBar(context,
              "ERROR: Casillas vacias, intente rellenarlas todas", true);
        case "usuarioNull":
          SnackbarWidget.showSnackBar(
              context, "ERROR: Este usuario no existe(no registrado)", true);
        case "passNull":
          SnackbarWidget.showSnackBar(
              context, "ERROR: Contraseña incorrecta o mal escrita", true);
        case "bien":
          SnackbarWidget.showSnackBar(context, "BIEN", false);
      }
    }

    SizedBox mytexfield(String texto, control, bool taparTexto) {
      return SizedBox(
        width: 500,
        child: TextField(
          obscureText: taparTexto,
          controller: control,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: texto.toUpperCase(),
            border: OutlineInputBorder(),
          ),
        ),
      );
    }

    Container contenedorBotones() {
      return Container(
        height: 400,
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0))
        ], borderRadius: BorderRadius.circular(40), color: containerColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mytexfield("numero de celular o correo electrónico",
                numeroCorreoController, false),
            const SizedBox(height: 20),
            mytexfield("contraseña", passwordController, true),
            const SizedBox(height: 30),
            boton("iniciar sesion", () {
              verificarDatos();
            })
          ],
        ),
      );
    }

    Container contenedorLogo() {
      return Container(
          padding: EdgeInsets.all(50),
          child: Image.asset(
            logoImg,
            width: 200,
          ));
    }

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("inicio");
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("INICIAR SESION"),
            Image.asset(
              logoImg,
              width: 40,
            )
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            contenedorBotones(),
            contenedorLogo(),
          ],
        ),
      ),
    );
  }
}
