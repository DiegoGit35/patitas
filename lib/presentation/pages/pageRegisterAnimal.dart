import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/enums/distrito.dart';
import 'package:patitas/domain/enums/tipo_de_caso.dart';
import 'package:patitas/domain/use_cases/administracion_patitas.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';
import 'package:patitas/presentation/widgets/imagenes.dart';
import 'package:patitas/presentation/widgets/snakbar.dart';

import '../../data/adaptador.dart';

class Pageregisteranimal extends StatefulWidget {
  const Pageregisteranimal({super.key});

  @override
  State<Pageregisteranimal> createState() => _PageRegistrarState();
}

class _PageRegistrarState extends State<Pageregisteranimal> {
  // SessionManager sessionManager = SessionManager();
  DateTime fechaSeleccionada = DateTime.now();
  TextEditingController direccion = TextEditingController();
  TextEditingController distrito = TextEditingController();
  TextEditingController contacto = TextEditingController();
  TextEditingController foto = TextEditingController();
  TipoDeCaso tipoDeCasoSeleccionado = TipoDeCaso.adopcion;
  Distrito distritoSeleccionado = Distrito.chilecito;
  String? fotoAnimal = fotoDefault;
  String fotoDef = fotoDefault;
  PlatformFile? pickerFile;

  @override
  Widget build(BuildContext context) {
    AdministracionPatitas adm = AdministracionPatitas();

    void resetAllControllers() {
      direccion.clear();
      distrito.clear();
      contacto.clear();
    }

    void guardarDatos() async {
      String mensaje = await adm.registrarNuevoCaso(
        direccion: direccion.text,
        distrito: distritoSeleccionado.formattedName,
        contacto: contacto.text,
        tipoDeCaso: tipoDeCasoSeleccionado,
        emailUsuarioRegistrante: "${await session.getUserId()}",
      );

      switch (mensaje) {
        case "casillas":
          SnackbarWidget.showSnackBar(
              context, "ERROR: Hay casillas sin rellenar", true);
          break;
        case "bien":
          SnackbarWidget.showSnackBar(context,
              "Caso $tipoDeCasoSeleccionado registrado con éxito", false);
          resetAllControllers();
          break;
      }
    }

    Widget myTextFormField(
        String text, control, bool rCheck, String type, bool taparTexto) {
      Map<String, dynamic> listImputs = {
        "Onlytext": [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
        "YearInput": [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          LengthLimitingTextInputFormatter(4),
        ],
        "RandomInputs": null,
        "NumbersOnly": [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          LengthLimitingTextInputFormatter(2),
        ]
      };
      return TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {}
        },
        inputFormatters: listImputs[type],
        controller: control,
        obscureText: taparTexto,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          hintText: text.toUpperCase(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              cambiarPantalla("menu");
            },
            icon: const Icon(Icons.arrow_back)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("REGISTRAR CASO"),
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
                offset: const Offset(0, 0))
          ], borderRadius: BorderRadius.circular(20), color: containerColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ////////////////////////////// ACA SE COLOCAN LOS WIDGETS //////////////////////////////
            children: [
              _WidgetFotoAnimal(),
              Row(
                children: [
                  Expanded(
                      child: myTextFormField("Direccion", direccion, false,
                          "RandomInputs", false)),
                  const SizedBox(width: 10),
                  Expanded(child: _distrito()),
                ],
              ),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: myTextFormField(
                      "Celular", contacto, false, "RandomInputs", false),
                ),
                const SizedBox(width: 10),
                Expanded(child: _tipoDeCaso())
              ]),
              const SizedBox(height: 20),
              boton("Guardar", () {
                guardarDatos();
              })
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<TipoDeCaso>> getTiposDeCasos() {
    return TipoDeCaso.values.map((TipoDeCaso tipo) {
      return DropdownMenuItem<TipoDeCaso>(
        value: tipo,
        child: Text(tipo.formattedName),
      );
    }).toList();
  }

  Widget _tipoDeCaso() {
    return DropdownButtonFormField(
      borderRadius: BorderRadius.circular(5),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      value: tipoDeCasoSeleccionado,
      items: getTiposDeCasos(),
      onChanged: (value) {
        setState(() {
          tipoDeCasoSeleccionado = value!;
        });
      },
    );
  }

  List<DropdownMenuItem<Distrito>> getDistritos() {
    return Distrito.values.map((Distrito distrito) {
      return DropdownMenuItem<Distrito>(
        value: distrito,
        child: Text(distrito.formattedName),
      );
    }).toList();
  }

  Widget _distrito() {
    return DropdownButtonFormField(
      borderRadius: BorderRadius.circular(5),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      value: distritoSeleccionado,
      items: getDistritos(),
      onChanged: (value) {
        setState(() {
          distritoSeleccionado = value!;
          print(distritoSeleccionado);
        });
      },
    );
  }

  Widget _WidgetFotoAnimal() {
    Future _seleccionarFoto() async {
      final imageDeDispositivo = await FilePicker.platform.pickFiles();
      setState(() {
        pickerFile = imageDeDispositivo!.files.first;
      });
    }

    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: pickerFile == null
                ? Image.asset(fotoDefault)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      File(pickerFile!.path!),
                      fit: BoxFit.cover,
                    )),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(6))),
          onPressed: () {
            _seleccionarFoto();
          },
          child: Text(
            "Subir foto",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
