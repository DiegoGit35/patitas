import 'package:flutter/material.dart';
import 'package:patitas/screens/routes/routes.dart';
import 'package:patitas/screens/widgets/botones.dart';
import 'package:patitas/screens/widgets/colores.dart';
import 'package:patitas/screens/widgets/imagenes.dart';

class Pageinicio extends StatelessWidget {
  const Pageinicio({super.key});

// windows GOD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            containerOne(context),
          ],
        ),
      ),
    );
  }
}

Container containerOne(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(logoImg, width: 220),
          SizedBox(
            child: Column(
              children: [
                boton("registrar usuario", () {
                  cambiarPantalla("registrarse");
                }),
                const SizedBox(height: 10),
                boton("iniciar sesión", () {
                  cambiarPantalla("login");
                }),
                const SizedBox(height: 10),
                boton("data", () {
                  cambiarPantalla("data");
                })
              ],
            ),
          )
        ],
      ),
    ),
  );
}
