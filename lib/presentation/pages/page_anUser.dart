import 'package:flutter/material.dart';
import 'package:patitas/domain/entities/usuario.dart';
import 'package:patitas/domain/enums/tipo_de_usuario.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/widgets/colores.dart';

// ignore: must_be_immutable
class PageAnuser extends StatelessWidget {
  Usuario usuario;
  PageAnuser({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://icons-for-free.com/iff/png/512/person+profile+user+icon-1320184051308863170.png",
                width: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texto("NOMBRE Y APELLIDO", 15, Colors.black, false),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: texto("${usuario.nombre!} ${usuario.apellido!}", 20,
                      Colors.black, true),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texto("TIPO DE USUARIO", 15, Colors.black, false),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: texto(
                      usuario.tipo == TipoDeUsuario.normal
                          ? "Normal"
                          : "Administrador",
                      20,
                      Colors.black,
                      true),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texto("SEXO", 15, Colors.black, false),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: texto(usuario.sexo!, 20, Colors.black, true),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
