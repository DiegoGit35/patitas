import 'package:flutter/material.dart';
import 'package:patitas/config/routes/routes.dart';
import 'package:patitas/domain/entities/caso.dart';
import 'package:patitas/domain/enums/tipo_de_caso.dart';
import 'package:patitas/domain/use_cases/administracion_patitas.dart';
import 'package:patitas/presentation/pages/pageAdopcion.dart';
import 'package:patitas/presentation/pages/pageTransitar.dart';
import 'package:patitas/presentation/pages/page_busqueda.dart';
import 'package:patitas/presentation/widgets/botones.dart';
import 'package:patitas/presentation/widgets/colores.dart';
import 'package:patitas/presentation/widgets/snakbar.dart';

class Pagecaso extends StatefulWidget {
  final Caso unCaso;
  const Pagecaso({super.key, required this.unCaso});

  @override
  State<Pagecaso> createState() => _PagecasoState();
}

class _PagecasoState extends State<Pagecaso> {
  bool procesando = false;
  bool animalAdoptado = false;

  AdministracionPatitas adm = AdministracionPatitas();

  void _funcionBoton(context) async {
    setState(() {
      procesando = true;
    });

    String mensaje = widget.unCaso.tipoDeCaso == TipoDeCaso.transito
        ? await adm.transitar(widget.unCaso)
        : await adm.adoptar(widget.unCaso);

    //--------- DESMARCAR ESTO CUANDO YA SE PUEDA MODIFICAR EL ESTADO DE UN CASO
    //----------vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv----------
    switch (mensaje) {
      case "YaAdoptado":
        SnackbarWidget.showSnackBar(
            context,
            widget.unCaso.tipoDeCaso == TipoDeCaso.adopcion
                ? "QUE MAL!!!, EL ANIMAL YA FUE ADOPTADO POR OTRA PERSONA"
                : "QUE MAL!!!, EL ANIMAL YA FUE TRANSITADO POR OTRA PERSONA",
            true);
        break;
      case "bien":
        SnackbarWidget.showSnackBar(
            context,
            widget.unCaso.tipoDeCaso == TipoDeCaso.adopcion
                ? "FELICIDADES, ADOPTASTE UN ANIMAL"
                : "FELICIDADES, TRANSITASTE UN ANIMAL",
            false);
        break;
    }

    setState(() {
      animalAdoptado = true;
      procesando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String tiempoRegistrado() {
      DateTime dateTimeRegister = DateTime.parse(widget.unCaso.fechaRegistro!);

      DateTime datetimeNow = DateTime.now();
      Duration diferencia = datetimeNow.difference(dateTimeRegister);
      if (diferencia.inDays > 0) {
        if (diferencia.inDays == 1) {
          return "Hace ${diferencia.inDays} dia";
        }
        return "Hace ${diferencia.inDays} dias";
      }

      if (diferencia.inHours > 0) {
        if (diferencia.inHours == 1) {
          return "Hace ${diferencia.inHours} hora";
        }
        return "Hace ${diferencia.inHours} horas";
      }

      if (diferencia.inMinutes > 0) {
        if (diferencia.inMinutes == 1) {
          return "Hace ${diferencia.inMinutes} minuto";
        }
        return "Hace ${diferencia.inMinutes} minutos";
      }

      if (diferencia.inSeconds > 0) {
        if (diferencia.inSeconds == 1) {
          return "Hace ${diferencia.inSeconds} segundo";
        }
        return "Hace ${diferencia.inSeconds} segundos";
      }

      return "Recien Agregado";
    }

    return Scaffold(
      backgroundColor: fondoColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                // ignore: unrelated_type_equality_checks
                MaterialPageRoute(
                    // ignore: unrelated_type_equality_checks
                    builder: (context) =>
                        widget.unCaso.tipoDeCaso == TipoDeCaso.adopcion
                            ? const PageAdopcion()
                            : widget.unCaso.tipoDeCaso == TipoDeCaso.transito
                                ? const Pagetransitar()
                                : const PageBusqueda()));
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
                  _fotoAnimal(widget.unCaso.foto),
                  const SizedBox(height: 10),
                  _textDatos(
                      "registrado por", widget.unCaso.usuarioRegistrante),
                  const Divider(),
                  _textDatos("hace", tiempoRegistrado()),
                  const Divider(),
                  const SizedBox(height: 10),
                  !animalAdoptado
                      ? _botonCaso(
                          procesando,
                          procesando ? () {} : () => _funcionBoton(context),
                          widget.unCaso,
                          widget.unCaso.tipoDeCaso == TipoDeCaso.adopcion
                              ? "ADOPTAR"
                              : "TRANSITAR",
                          widget.unCaso.tipoDeCaso == TipoDeCaso.adopcion
                              ? "ADOPTANDO..."
                              : "TRANSITANDO...",
                          widget.unCaso.tipoDeCaso == TipoDeCaso.adopcion
                              ? true
                              : widget.unCaso.tipoDeCaso == TipoDeCaso.transito
                                  ? true
                                  : false)
                      : Container()
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

Widget _botonCaso(bool procesando, Function funcion, Caso unCaso,
    String tituloNormal, String tituloProcesando, bool showButton) {
  print(unCaso.tipoDeCaso);
  if (showButton) {
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
              procesando ? tituloProcesando : tituloNormal,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            if (procesando) ...[
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
  } else {
    return Container();
  }
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
    decoration: const BoxDecoration(
      // border:
      //     Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 3),
      shape: BoxShape.circle,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(900),
      child: Image.asset(foto),
    ),
  );
}
