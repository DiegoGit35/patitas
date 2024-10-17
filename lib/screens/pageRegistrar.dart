import 'package:flutter/material.dart';
import 'package:patitas/data/adaptador.dart';
import 'package:patitas/entidades/fecha.dart';
import 'package:patitas/entidades/usuario.dart';
import 'package:patitas/screens/routes/routes.dart';
import 'package:patitas/screens/widgets/botones.dart';
import 'package:patitas/screens/widgets/colores.dart';
import 'package:patitas/screens/widgets/imagenes.dart';

class PageRegistrar extends StatefulWidget {
  const PageRegistrar({super.key});

  @override
  State<PageRegistrar> createState() => _PageRegistrarState();
}

class _PageRegistrarState extends State<PageRegistrar> {
  bool generoHombre = false;
  bool generoMujer = false;
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController diaController = TextEditingController();
  TextEditingController mesController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController generoOtroController = TextEditingController();

    void guardarDatos() {
      if (nombreController.text.isEmpty ||
          apellidoController.text.isEmpty ||
          telefonoEmailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          diaController.text.isEmpty ||
          mesController.text.isEmpty ||
          yearController.text.isEmpty) {
        print("FALTAN DATOS");
        return;
      }

      if (!generoHombre && !generoMujer && generoOtroController.text.isEmpty) {
        print("SELECCIONE TU GENERO");
        return;
      }

      String generoUsuario = "";

      if (generoHombre) {
        generoUsuario = "Masculino";
      } else if (generoMujer) {
        generoUsuario = "Femenino";
      } else {
        generoUsuario = generoOtroController.text;
      }

      Fecha fechaUser = Fecha(
          dia: int.parse(diaController.text),
          mes: int.parse(mesController.text),
          year: int.parse(yearController.text));

      Usuario newUsuario = Usuario(
          nombre: nombreController.text,
          apellido: apellidoController.text,
          telefonoOEmail: telefonoEmailController.text,
          password: passwordController.text,
          fechaNacimiento: fechaUser,
          genero: generoUsuario);

      adminApp.registrarse(newUsuario);
    }

    void clickCheckbox(newValor, String genero) {
      setState(() {
        if (genero == "m") {
          generoHombre = newValor;
          generoMujer = false;
        } else {
          generoHombre = false;
          generoMujer = newValor;
        }
      });
    }

    Widget myTextfield(String text, control, bool rCheck) {
      return TextField(
        controller: control,
        onTap: () {
          if (rCheck) {
            setState(() {
              generoHombre = false;
              generoMujer = false;
            });
          }
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          hintText: text.toUpperCase(),
        ),
      );
    }

    Widget myCheckBox(String text, valor, funcion, bool border, String genero) {
      return Container(
        decoration: BoxDecoration(
            border: border == true ? Border.all(color: Colors.black) : null,
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        width: 200,
        child: CheckboxListTile(
          title: Text(text),
          value: valor,
          onChanged: (nuevoValor) {
            clickCheckbox(nuevoValor, genero);
          },
          activeColor: Colors.black,
          checkColor: Colors.white,
        ),
      );
    }

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("inicio");
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("REGISTRARSE"),
            Image.asset(
              logoImg,
              width: 40,
            )
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 100, right: 100, top: 30, bottom: 30),
        child: Container(
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0))
          ], borderRadius: BorderRadius.circular(20), color: containerColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: myTextfield("Nombre", nombreController, false)),
                  const SizedBox(width: 10),
                  Expanded(
                      child:
                          myTextfield("Apellido", apellidoController, false)),
                ],
              ),
              const SizedBox(height: 10),
              myTextfield("numero de celular o correo electronico",
                  telefonoEmailController, false),
              const SizedBox(height: 10),
              myTextfield("contraseña", passwordController, false),
              const SizedBox(height: 10),
              const Text("Fecha de nacimiento"),
              Row(
                children: [
                  Expanded(child: myTextfield("dia", diaController, false)),
                  const SizedBox(width: 10),
                  Expanded(child: myTextfield("mes", mesController, false)),
                  const SizedBox(width: 10),
                  Expanded(child: myTextfield("año", yearController, false)),
                ],
              ),
              const SizedBox(height: 20),
              const Text("SEXO"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myCheckBox("Hombre", generoHombre, () {}, true, "m"),
                  const SizedBox(width: 10),
                  myCheckBox("Mujer", generoMujer, () {}, true, "f"),
                  const SizedBox(width: 10),
                  SizedBox(
                      width: 200,
                      child: myTextfield("Otras", generoOtroController, true))
                ],
              ),
              const SizedBox(height: 60),
              boton("registrarse", () {
                guardarDatos();
              })
            ],
          ),
        ),
      ),
    );
  }
}
