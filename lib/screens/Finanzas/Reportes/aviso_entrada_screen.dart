import 'dart:typed_data';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:enroll_app/models/index.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/date_symbol_data_local.dart'; // for other locales

bool TieneCorreo = false;

Future<Uint8List> avisoEntradaPdf(ClienteType? empleado, String correo) async {
  TieneCorreo = correo != '';
  final pdf = Document();
  initializeDateFormatting('es');
  final DateTime now = DateTime.now();
  final String formatter = DateFormat.yMMMMEEEEd('es').format(now);
  final DateTime? ingreso = empleado?.fechaIngreso;
  final String fecIng = DateFormat.yMd('es').format(ingreso!);
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/LogoRiasem.png')).buffer.asUint8List());

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            //ENCABEZADO
            Padding(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image(imageLogo),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('           Grupo Riasem',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('           Registro de Novedades',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            //FECHA
            Container(
              decoration:
                const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0))),
            ),
            Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Fecha: ${formatter}'),
                ],
              ),
              //Text('Fecha: lunes 25 abril 2022'),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            //INFORMACION DE LA EMPRESA
            Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Información de la Empresa:          ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('\n'),
                      Text('Representante Legal:'),
                      //style: (TextStyle(height: 2))),
                      Text('Empleador:'),
                      Text('Ruc:'),
                      Text('Sucursal:'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('\n'),
                      Text('\n'),
                      Text('\n'),
                      Text(
                        '${empleado?.representanteLegal}',
                        overflow: TextOverflow.clip,
                      ),
                      Text('${empleado?.empresa}'),
                      Text('${empleado?.rucEmpresa}'),
                      Text('${empleado?.sucursal}'),
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1.0))),
            ),
            //INFORMACION DE LA NOVEDAD
            Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Información de la Novedad:           ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('\n'),
                      Text('Tipo de Novedad: '),
                      Text('Afiliado: '),
                      Text('Cédula: '),
                      Text('Dirección: '),
                      Text('Fecha de Afectación: '),
                      Text('Relación de trabajo: '),
                      Text('Actividad Sectorial: '),
                      Text('Actividad: '),
                      Text('Sueldo: '),
                      Text('Aportación Normal: '),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('\n'),
                      Text('\n'),
                      Text('\n'),
                      Text('${empleado?.tipoNovedad}'),
                      Text('${empleado?.apellidos} ${empleado?.nombres}'),
                      Text('${empleado?.identificacion}'),
                      Text(
                        '${empleado?.direccionEmpleado}',
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                      ),
                      Text('${fecIng}'),
                      Text('${empleado?.tipoContrato}'),
                      Text('${empleado?.actividadSectorial}'),
                      Text('${empleado?.cargo}'),
                      Text('US\$ ${empleado?.sueldo}'),
                      Text('${empleado?.aportacionNominal}'),
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 200),
            ),
            Container(),
            //FOOTER
            Padding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('------------------------------'),
                  Text('Firma del Representante Legal'),
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0),
                      top: BorderSide(width: 1.0))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
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
          "alias": empleado!.nombres!,
          "plantilla": "DocEmpleado",
          "archivoBase64": base64documento,
          "nombreArchivo": "aviso_entrada.pdf",
          "asunto": "Aviso de entrada"
        }));
    print('Correo enviado');
  }
  if(TieneCorreo)
  certificadoAE();
  return pdf.save();
}
