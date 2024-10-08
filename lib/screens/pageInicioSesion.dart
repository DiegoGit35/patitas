import 'package:flutter/material.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/screens/routes/routes.dart';
import 'package:patitas/screens/widgets/botones.dart';
import 'package:patitas/screens/widgets/colores.dart';

class Pageiniciosesion extends StatelessWidget {
  const Pageiniciosesion({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numeroCorreoController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void verificarDatos() {
      String numeroCorreo = numeroCorreoController.text;
      String password = passwordController.text;

      bool passwordCheck = false;
      bool numeroCheck = false;

      if (numeroCorreo.isEmpty || password.isEmpty) {
        print("ERROR: FALTAN DATOS");
        return;
      }

      for (Usuario user in adaptador.listaUsuario) {
        if (user.password == password) {
          passwordCheck = true;
        }

        if (user.telefonoOEmail == numeroCorreo) {
          numeroCheck = true;
        }
      }

      if (!passwordCheck) {
        print("ERROR: CONTRASEÑA INCORRECTA");
        return;
      } else if (!numeroCheck) {
        print("ERROR: CORREO O NUMERO INCORRECTOS O NO REGISTRADO");
        return;
      }

      print("TODO CORRECTO, SESSION INICIADA");
    }

    SizedBox mytexfield(String texto, control) {
      return SizedBox(
        width: 500,
        child: TextField(
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
                numeroCorreoController),
            const SizedBox(height: 20),
            mytexfield("contraseña", passwordController),
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
            "assets/imagenes/logo.png",
            width: 200,
          ));
    }

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("inicio", context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("INICIAR SESION"),
            Image.asset(
              "assets/imagenes/logo.png",
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
