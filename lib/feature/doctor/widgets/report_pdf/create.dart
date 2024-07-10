import 'package:flutter/material.dart';
import 'package:graduation_app/feature/doctor/widgets/report_pdf/pdf_report.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            PdfGenerator.createPdf();
          },
          child: Text("Create PDF"),
        ),
      ),
    );
  }

}