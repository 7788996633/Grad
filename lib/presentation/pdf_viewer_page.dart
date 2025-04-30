import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerPage extends StatelessWidget {
  final String pdfContent;

  const PDFViewerPage({Key? key, required this.pdfContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: PDFView(
        filePath: pdfContent,
        onPageError: (page, error) {
          print("Error: $error");
        },
      ),
    );
  }
}
