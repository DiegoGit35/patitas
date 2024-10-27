import 'package:flutter/material.dart';
import 'package:patitas/presentation/widgets/colores.dart';

SizedBox boton(String nombre, Function funcion) {
  // bool mouseEnBoton = false;
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          animationDuration: const Duration(seconds: 1),
          backgroundColor: colorBoton,
          overlayColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          )),
      onPressed: () {
        funcion();
      },
      child: Text(
        nombre.toUpperCase(),
        style: TextStyle(color: colorTextBotones),
      ),
    ),
  );
}
