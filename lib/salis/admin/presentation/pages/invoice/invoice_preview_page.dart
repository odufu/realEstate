import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:file_picker/file_picker.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage();

  // Function to generate PDF
  Future<Uint8List> _generateInvoice() async {
    final pdf = pw.Document();

    final logo =
        await imageFromAssetBundle('assets/mcdreamslogo.png'); // Your logo path

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Invoice Details
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Image(logo, width: 50),
                      pw.Text("MCDREAM HOMES & PROPERTIES LTD.",
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold)),
                      pw.Text("Empowering Dreams & Inspiring Futures",
                          style: const pw.TextStyle(fontSize: 8)),
                    ],
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(10),
                    color: PdfColors.deepPurple,
                    child: pw.Text("INVOICE",
                        style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold)),
                  ),
                ],
              ),

              pw.SizedBox(height: 20),

              // Table
              // ignore: deprecated_member_use
              pw.Table.fromTextArray(
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.deepPurple),
                headerStyle: pw.TextStyle(
                    color: PdfColors.white, fontWeight: pw.FontWeight.bold),
                headers: ["Property Description", "Qty", "Price", "Total"],
                data: [
                  [
                    "House 1\n123 Anywhere St., Any City",
                    "1",
                    "N 15,000",
                    "N 15,000"
                  ],
                  [
                    "House 2\n123 Anywhere St., Any City",
                    "1",
                    "N 12,000",
                    "N 12,000"
                  ]
                ],
                columnWidths: {
                  0: const pw.FlexColumnWidth(4),
                  1: const pw.FlexColumnWidth(1),
                  2: const pw.FlexColumnWidth(2),
                  3: const pw.FlexColumnWidth(2),
                },
              ),
              pw.SizedBox(height: 10),

              // Total Section
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text("Total: N 27,000",
                    style: pw.TextStyle(
                        fontSize: 12, fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 20),

              // Footer
              pw.Text("PAYMENT INFORMATION",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 12)),
              pw.Text(
                  "PROPERTY ID: DKH-PAYS-258648665\nCONTRACT ID: DKH-PAYS-258648665\nPAYMENT HISTORY: DKH-PAYS-258648665",
                  style: const pw.TextStyle(fontSize: 10)),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // Print and Preview PDF
  void _printPdf(BuildContext context) async {
    final pdfData = await _generateInvoice();
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice")),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.print),
          label: const Text("Print Invoice"),
          onPressed: () => _printPdf(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white),
        ),
      ),
    );
  }
}
