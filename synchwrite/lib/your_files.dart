// your_files.dart

import 'package:flutter/material.dart';

class YourFilesPage extends StatelessWidget {
  final List<String> fileNames = [
    'File 1.txt',
    'File 2.docx',
    'File 3.pdf',
    'File 4.png',
    // Add more file names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Files'),
      ),
      body: ListView.builder(
        itemCount: fileNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fileNames[index]),
            // Add any additional details or actions here
          );
        },
      ),
    );
  }
}
