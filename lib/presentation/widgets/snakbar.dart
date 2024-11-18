import 'package:flutter/material.dart';
import 'package:dartz/dartz_streaming.dart'
    as dartz; // Asignar prefijo para evitar conflicto con Text

class SnackbarWidget {
  static void showSnackBar(BuildContext context, String message, bool isError) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: isError ? Colors.white : Colors.black),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      action: SnackBarAction(
        label: 'quitar',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
