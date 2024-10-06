import 'package:flutter/material.dart';
import 'package:patitas/screens/routes/routes.dart';
import 'package:patitas/screens/widgets/colores.dart';

class PageRegistrar extends StatelessWidget {
  const PageRegistrar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController telefonoEmailController = TextEditingController();

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
            Text("REGISTRARSE"),
            Image.asset(
              "assets/imagenes/logo.png",
              width: 40,
            )
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, left: 100, right: 100, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: myTextfield("Nombre", nombreController)),
                const SizedBox(width: 10),
                Expanded(child: myTextfield("Apellido", nombreController)),
              ],
            ),
            const SizedBox(height: 10),
            myTextfield("numero de celular o correo electronico",
                telefonoEmailController),
            const SizedBox(height: 10),
            myTextfield("contraseña nueva", telefonoEmailController),
            const SizedBox(height: 20),
            const Text("FECHA DE NACIMIENTO"),
            Row(
              children: [
                Expanded(child: myTextfield("DIA", nombreController)),
                const SizedBox(width: 10),
                Expanded(child: myTextfield("MES", nombreController)),
                const SizedBox(width: 10),
                Expanded(child: myTextfield("AÑO", nombreController)),
              ],
            ),
            const SizedBox(height: 20),
            const Text("SEXO"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myCheckBox("Hombre", false, () {}),
                const SizedBox(width: 10),
                myCheckBox("Mujer", false, () {}),
                const SizedBox(width: 10),
                myExpansionTile("OTRAS")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget myTextfield(String text, control) {
  return TextField(
    controller: control,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
      hintText: text,
    ),
  );
}

Widget myButton(String text, control) {
  return ElevatedButton(onPressed: () {}, child: Text(text));
}

Widget myCheckBox(String text, valor, funcion) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white),
    width: 200,
    child: CheckboxListTile(
      title: Text(text),
      value: valor,
      onChanged: (bool? nuevoValor) {
        funcion();
      },
      activeColor: Colors.black,
      checkColor: Colors.red,
    ),
  );
}

Widget myExpansionTile(String text) {
  return SizedBox(
    width: 200,
    child: ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      title: Text(text),
      children: [
        itemsOptions("coso"),
        itemsOptions("coso"),
        itemsOptions("coso"),
      ],
    ),
  );
}

Widget itemsOptions(String text) {
  return ElevatedButton(onPressed: () {}, child: Text(text));
}
