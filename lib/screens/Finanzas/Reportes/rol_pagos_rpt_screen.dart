import 'dart:convert';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:enroll_app/models/index.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

bool TieneCorreo = false;

Future<Uint8List> rolPdf(RolDePago rolDePago, String correo, String PeriodoDesc) async {
  TieneCorreo = correo != '';

  final pdf = Document();
  String? observacion;
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/LogoRiasem.png')).buffer.asUint8List());
  if (rolDePago.observacion == null) {
    observacion = '';
  } else {
    observacion = rolDePago.observacion;
  }
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ROL DE PAGO',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$PeriodoDesc ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 7))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Compañía: ',
                              style: TextStyle(
                                  fontSize: 7, fontWeight: FontWeight.bold)),
                          Text('${rolDePago.cabeceraRol?.empresa}',
                              style: TextStyle(fontSize: 7)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('División: ',
                              style: TextStyle(
                                  fontSize: 7, fontWeight: FontWeight.bold)),
                          Text('${rolDePago.cabeceraRol?.division}',
                              style: TextStyle(fontSize: 7)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Sucursal: ',
                              style: TextStyle(
                                  fontSize: 7, fontWeight: FontWeight.bold)),
                          Text('${rolDePago.cabeceraRol?.sucursal}',
                              style: TextStyle(fontSize: 7)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${rolDePago.cabeceraRol?.apellidos} ${rolDePago.cabeceraRol?.nombres}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Tipo Nómina',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                      Text('Área',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                      Text('Cargo',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${rolDePago.cabeceraRol?.tipoNomina}',
                          style: TextStyle(fontSize: 7)),
                      Text('${rolDePago.cabeceraRol?.area}',
                          style: TextStyle(fontSize: 7)),
                      Text('${rolDePago.cabeceraRol?.cargo}',
                          style: TextStyle(fontSize: 7)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Proceso',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                      Text('CCosto',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                      Text('Sueldo',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${rolDePago.cabeceraRol?.proceso}',
                          style: TextStyle(fontSize: 7)),
                      Text('${rolDePago.cabeceraRol?.centroCosto}',
                          style: TextStyle(fontSize: 7)),
                      Text('${rolDePago.cabeceraRol?.sueldo}',
                          style: TextStyle(fontSize: 7)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Periodo',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                      Text('SCosto',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                      Text('Forma Pago',
                          style: TextStyle(
                              fontSize: 7, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${rolDePago.cabeceraRol?.periodo}',
                          style: TextStyle(fontSize: 7)),
                      Text('${rolDePago.cabeceraRol?.subCentroCosto}',
                          style: TextStyle(fontSize: 7)),
                      Text('${rolDePago.cabeceraRol?.tipoPago}',
                          style: TextStyle(fontSize: 7)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('INGRESOS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 7)),
                  Text('EGRESOS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 7)),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 241,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cant. Valor',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 7),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total Ingresos: ${rolDePago.totalIngresos}',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 7),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total Ingresos: ${rolDePago.totalIngresos}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 7),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 241,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total Egresos: ${rolDePago.totalEgresos}',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 7),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Neto a pagar: ${rolDePago.netoPagar}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7),
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
              width: 482,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  Text(
                    '    Observación : ${observacion}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'FIRMA DEL EMPLEADO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7),
                  ),
                  Text(
                    'RRHH',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7),
                  ),
                ],
              ),
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
          "alias": rolDePago.cabeceraRol!.nombres!,
          "plantilla": "DocEmpleado",
          "archivoBase64": base64documento,
          "nombreArchivo": "rol_de_pago.pdf",
          "asunto": "Rol De Pago"
        }));
  }

  if(TieneCorreo)
  certificadoAE();

  return pdf.save();
}

// Widget PaddedText(
//   final String text, {
//   final TextAlign align = TextAlign.left,
// }) =>
//     Padding(
//       padding: EdgeInsets.all(10),
//       child: Text(
//         text,
//         textAlign: align,
//       ),
//     );
