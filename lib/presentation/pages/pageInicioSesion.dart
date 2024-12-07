import 'package:flutter/material.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/enums/estado_de_caso.dart';
import 'package:patitas/domain/enums/mensages_login.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';
import 'package:patitas/presentation/widgets/imagenes.dart';
import 'package:patitas/presentation/widgets/snakbar.dart';

import '../../data/adaptador.dart';

class Pageiniciosesion extends StatefulWidget {
  const Pageiniciosesion({super.key});

  @override
  State<Pageiniciosesion> createState() => _PageiniciosesionState();
}

class _PageiniciosesionState extends State<Pageiniciosesion> {
  bool verificando = false;
  TextEditingController numeroCorreoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void resetAllControllers() {
      numeroCorreoController.clear();
      passwordController.clear();
    }

    void verificarDatos() async {
      String numeroCorreo = numeroCorreoController.text;
      String password = passwordController.text;
      setState(() {
        verificando = true;
      });

      print("....................VERIFICANDO....................");

      EstadoLogin mensaje =
          await adminApp.iniciarSesion(numeroCorreo, password);

      print("....................DATOS VERIFICADOS....................");

      switch (mensaje) {
        case EstadoLogin.casillasVacias:
          SnackbarWidget.showSnackBar(context,
              "ERROR: Casillas vacias, intente rellenarlas todas", true);
          setState(() {
            verificando = false;
          });
        case EstadoLogin.cuentaNoExiste:
          SnackbarWidget.showSnackBar(
              context, "ERROR: Este usuario no existe(no registrado)", true);
          setState(() {
            verificando = false;
          });
        case EstadoLogin.contrasenaIncorrecta:
          SnackbarWidget.showSnackBar(
              context, "ERROR: Contraseña incorrecta o mal escrita", true);
          setState(() {
            verificando = false;
          });
        case EstadoLogin.cuentaEncontrada:
          cambiarPantalla("menu");
        case EstadoLogin.cuentaDesactivada:
          SnackbarWidget.showSnackBar(
              context, "ERROR: Esta cuenta está desactivada", true);
          setState(() {
            verificando = false;
          });
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
            BotonIniciar(
              funcion: () => verificarDatos(),
              tittle: "iniciar session",
              verificando: verificando,
            )
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

class BotonIniciar extends StatelessWidget {
  VoidCallback funcion;
  String tittle;
  bool verificando;
  BotonIniciar(
      {super.key,
      required this.funcion,
      required this.tittle,
      required this.verificando});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: verificando ? null : funcion,
            child: verificando
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Text(
                          "VERIFICANDO.....",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                      ])
                : Text(tittle, style: const TextStyle(color: Colors.black))));
  }
}
