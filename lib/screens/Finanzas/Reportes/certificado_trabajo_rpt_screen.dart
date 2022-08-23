import 'dart:typed_data';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:enroll_app/models/index.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/date_symbol_data_local.dart'; // for other locales
import 'package:http/http.dart' as http;

bool TieneCorreo = false;

Future<Uint8List> certLabPdf(ClienteType? invoice, String correo, bool MostrarSueldo) async {
  TieneCorreo = correo != '';
  final pdf = Document();
  //final String formatted = formatter.format(now);
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/LogoRiasem.png')).buffer.asUint8List());

  initializeDateFormatting('es');
  final DateTime now = DateTime.now();
  final String formatter = DateFormat.yMMMMd('es').format(now);
  final DateTime? fechIng = invoice?.fechaIngreso;
  final String fechaIngreso = DateFormat.yMMMMEEEEd('es').format(fechIng!);
  //print('Apellido: ${invoice?.apellidos}');
  String LineaSueldo = '';

  if(MostrarSueldo) {
    LineaSueldo = "Por medio del presente CERTIFICO que el Sr/Sra. ${invoice?.apellidos} ${invoice?.nombres} con Cédula de Ciudadanía No. ${invoice?.identificacion} labora para nuestra compañía ${invoice?.empresa} con Ruc: ${invoice?.rucEmpresa}, desde el $fechaIngreso hasta la actualidad desempeñando el cargo de ${invoice?.cargo}, percibiendo un sueldo de \$${invoice?.sueldo}";
  } else {
    LineaSueldo = "Por medio del presente CERTIFICO que el Sr/Sra. ${invoice?.apellidos} ${invoice?.nombres} con Cédula de Ciudadanía No. ${invoice?.identificacion} labora para nuestra compañía ${invoice?.empresa} con Ruc: ${invoice?.rucEmpresa}, desde el $fechaIngreso hasta la actualidad desempeñando el cargo de ${invoice?.cargo}.";
  }

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(imageLogo),
                ),
                Column(
                  children: [Text("Guayaquil, $formatter")],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
              ],
            ),
            Container(height: 50),
            Padding(
              child: Text("CERTIFICADO DE TRABAJO",
                  style: Theme.of(context).header1),
              padding: EdgeInsets.all(20),
            ),
            Container(height: 50),
            Padding(
              child: Text(
                '$LineaSueldo ',
                textAlign: TextAlign.justify,
                //style: Theme.of(context).header2,
              ),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            Container(height: 50),
            Padding(
              child: Text(
                "Autorizo al Sr/Sra. ${invoice?.apellidos} ${invoice?.nombres} hacer uso del presente certificado como estime conveniente.",
                textAlign: TextAlign.justify,
                //style: Theme.of(context).header2,
              ),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            ),
            Container(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Text(
                'Atentamente,',
                // style: Theme.of(context).header3.copyWith(
                //       fontStyle: FontStyle.italic,
                //     ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.all(0)),
            Text('${invoice?.encargadoCorporativoRrhh}'),
            Text('${invoice?.cargoCorporativoRrhh}'),
            Text('${invoice?.grupoCorporativoRrhh}'),
          ],
        );
      },
    ),
  );
  final bytes = await pdf.save();
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/rolpago.pdf');
  await file.writeAsBytes(bytes);
  print(dir);
  List<int> documento = await file.readAsBytesSync();
  print(documento);
  String base64documento = base64Encode(documento);
  print(base64documento);
  void certificadoAE() async {
    var url =
        Uri.parse("http://200.110.64.17:5205/api/v1/Notificaciones/SendEmail");
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "para": correo,
          "alias": invoice!.nombres!,
          "plantilla": "DocEmpleado",
          "archivoBase64": base64documento,
          "nombreArchivo": "certificado_trabajo.pdf",
          "asunto": "Certificado de trabajo"
        }));
    print('Correo enviado');
  }
  if(TieneCorreo)
  certificadoAE();
  return pdf.save();
}
