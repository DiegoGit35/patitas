import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fechatest extends StatefulWidget {
  const Fechatest({super.key});

  @override
  State<Fechatest> createState() => _FechatestState();
}

class _FechatestState extends State<Fechatest> {
  late DateTime fechaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              onPressed: () async {
                final DateTime? datetime = await showDatePicker(
                    context: context,
                    initialDate: fechaSeleccionada,
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2025));

                if (datetime != null) {
                  setState(() {
                    fechaSeleccionada = datetime;
                    print(
                        "------------- FECHA SELECCIONADA --------------- ${fechaSeleccionada.day}");
                  });
                }
              },
              child: const Text(
                "SELECCIONE SU FECHA DE NACIMIENTO",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
                fechaSeleccionada != null
                    ? "   :  ${fechaSeleccionada.day}/${fechaSeleccionada.month}/${fechaSeleccionada.year}"
                    : "00/00/0000",
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
