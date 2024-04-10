import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../utils/globals.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

Future<Uint8List> getPdf({required Size size}) async {
  final pw.Document pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Text('Invoice', textScaleFactor: 2),
          ),
          pw.Header(
            level: 1,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                    'Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                pw.Text('Invoice No: INV-${Globals.globals.billNumber}'),
              ],
            ),
          ),
          pw.Divider(),
          pw.SizedBox(height: 10),
          pw.Text('Customer Information:', textScaleFactor: 1.5),
          pw.Text(
              'Customer Name:  ${Globals.globals.firstName} ${Globals.globals.lastName}'),
          pw.Text('Address: Amroli, Surat'),
          pw.Text('Email: darshanhadiyal@gmail.com'),
          pw.Text('Phone: 8200229474'),
          pw.SizedBox(height: 10),
          pw.Divider(),
          pw.SizedBox(height: 20),
          pw.Text('Product Details:', textScaleFactor: 1.5),
          pw.Table.fromTextArray(
            headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
            cellAlignment: pw.Alignment.centerLeft,
            headerAlignment: pw.Alignment.centerLeft,
            data: List<List>.generate(
              Globals.nameController.length,
              (index) => [
                (index + 1).toString(), // No.
                Globals.nameController[index].text, // Title
                Globals.quentyController[index].text, // Qty.
                Globals.priceController[index].text, // Val
                (int.parse(Globals.quentyController[index].text.isNotEmpty
                            ? Globals.quentyController[index].text
                            : "0") *
                        int.parse(Globals.priceController[index].text.isNotEmpty
                            ? Globals.priceController[index].text
                            : "0"))
                    .toString(), // Amt.
              ],
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Divider(),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text('Total:', textScaleFactor: 1.5),
              pw.SizedBox(width: 10),
              pw.Text('${Globals.totalValue} Rs.', textScaleFactor: 1.5),
            ],
          ),
          pw.Divider(),
          pw.SizedBox(height: 20),
          pw.Text(
            'Thank you for choosing us!\nNareshbhai Hadiyal : 9913531755\nRajeshbhai Hadiyal  : 9879085428',
            style: const pw.TextStyle(color: PdfColors.black),
          ),
        ];
      },
    ),
  );

  return pdf.save();
}

class _PdfPageState extends State<PdfPage> {
  @override
  void initState() {
    Globals.globals.calculateTotalValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PdfPreview(
        build: (PdfPageFormat format) => getPdf(size: size),
      ),
    );
  }
}
