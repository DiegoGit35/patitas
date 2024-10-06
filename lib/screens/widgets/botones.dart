import 'package:flutter/material.dart';

SizedBox boton(String nombre, Function funcion) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: () {
        funcion();
      },
      child: Text(
        nombre.toUpperCase(),
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}
