import 'package:flutter/material.dart';

SizedBox boton(String nombre, Function funcion) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 163, 138, 104),
          overlayColor: const Color.fromARGB(255, 255, 0, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: () {
        funcion();
      },
      child: Text(
        nombre.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
