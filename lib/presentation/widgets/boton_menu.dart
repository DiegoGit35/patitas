import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotonMenu extends StatelessWidget {
  String tittle;
  IconData icon;
  VoidCallback funcion;
  BotonMenu(
      {super.key,
      required this.tittle,
      required this.icon,
      required this.funcion});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: funcion,
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 105, 105, 105),
            ),
            const SizedBox(width: 10),
            Text(
              tittle.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
