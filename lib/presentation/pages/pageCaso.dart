import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/domain/use_cases/administracion_patitas.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';

class Pagecaso extends StatefulWidget {
  final Caso unCaso;
  const Pagecaso({super.key, required this.unCaso});

  @override
  State<Pagecaso> createState() => _PagecasoState();
}

class _PagecasoState extends State<Pagecaso> {
  bool adoptando = false;

  AdministracionPatitas adm = AdministracionPatitas();

  void _funcionBoton() async {
    print(".................ADOPTANDO...............");
    setState(() {
      print("hola desde el state");
      adoptando = true;
    });

    String mensaje = await adm.adoptar(widget.unCaso);
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeRegister = DateTime.parse(widget.unCaso.fechaRegistro!);
    DateTime datetimeNow = DateTime.now();
    Duration diferencia = datetimeNow.difference(dateTimeRegister);
    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageAdopcion()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cajaContainer(
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _fotoAnimal("foto"),
                  const SizedBox(height: 10),
                  _textDatos(
                      "registrado por", "${widget.unCaso.usuarioAdoptante}"),
                  const Divider(),
                  _textDatos("hace", "${diferencia.inDays} dias"),
                  const Divider(),
                  const SizedBox(height: 10),
                  // boton("adoptar", () {})
                  _botonAdoptar(adoptando, () {
                    _funcionBoton();
                  })
                ],
              ),
            ),
            const SizedBox(width: 20),
            _cajaContainer(
              SizedBox(
                width: 500,
                child: Column(
                  children: [
                    _textDatos("distrito", widget.unCaso.distrito),
                    const Divider(),
                    _textDatos("direccion", widget.unCaso.direccion),
                    const Divider(),
                    _textDatos("contacto", widget.unCaso.contacto),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _botonAdoptar(bool adoptando, Function funcion) {
  return SizedBox(
    width: 300,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5)))),
      onPressed: () => funcion(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            adoptando ? "ADOPTANDO" : "ADOPTAR",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          if (adoptando) ...[
            const SizedBox(width: 10),
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black,
              ),
            ),
          ]
        ],
      ),
    ),
  );
}

Widget _cajaContainer(Widget misWidget) {
  return IntrinsicHeight(
    child: Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0.2,
              offset: Offset(0, 0),
            )
          ]),
      child: misWidget,
    ),
  );
}

Widget _textDatos(String info, String data) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      children: [
        Text(info.toUpperCase()),
        Text(
          data.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget _fotoAnimal(String foto) {
  return Container(
    width: 300,
    height: 300,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 3),
      shape: BoxShape.circle,
      color: const Color.fromARGB(255, 117, 33, 27),
    ),
    child: Center(
      child: Text(
        foto,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
