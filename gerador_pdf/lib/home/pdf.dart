import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatelessWidget {
  PdfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) async {
          return await _pdf();
        },
      ),
    );
  }

  _pdf() async {
    final doc = pw.Document();
    final image = await imageFromAssetBundle('lib/assets/logo.jpeg');
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Row(
                children: [
                  pw.Image(
                    image,
                    width: 80,
                  ),
                  pw.SizedBox(
                    width: 10,
                  ),
                  pw.Text(
                    "SERVIÇO CUNHA DE ASSISTÊNCIA 12X08",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 40,
              ),
              pw.Text(
                "Nº:1010",
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                ),
                textAlign: pw.TextAlign.right,
              ),
              pw.SizedBox(
                height: 10,
              ),
              pw.Text(
                "Paciente:",
                style: const pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              pw.SizedBox(
                height: 35,
              ),
              pw.Text(
                "Receituário",
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.Divider(
                color: PdfColors.grey,
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Text(
                "Medicamento 01",
                style: const pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              pw.SizedBox(
                height: 100,
              ),
              pw.Text(
                "Observações:",
                style: const pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              pw.Expanded(child: pw.Container()),
              pw.Text(
                "Agradecemos a preferência",
                style: const pw.TextStyle(
                  fontSize: 10,
                ),
                textAlign: pw.TextAlign.center,
              ),
              
            ],
          );
        },
        
      ),
      
    );
    return doc.save();
  }
}
