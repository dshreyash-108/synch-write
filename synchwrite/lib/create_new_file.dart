// create_new_file.dart

import 'package:flutter/material.dart';

class CreateNewFilePage extends StatefulWidget {
  @override
  _CreateNewFilePageState createState() => _CreateNewFilePageState();
}

class _CreateNewFilePageState extends State<CreateNewFilePage> {
  final TextEditingController _fileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New File'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter a name for your new file:'),
            SizedBox(height: 8),
            TextField(
              controller: _fileNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'File Name',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your logic to create a new file with the provided name
                String fileName = _fileNameController.text.trim();
                if (fileName.isNotEmpty) {
                  // Handle file creation logic here
                  // For simplicity, we'll just print the file name for now
                  print('New file created: $fileName');
                  // You can add your actual file creation logic here
                  Navigator.pop(context); // Close the Create New File page
                }
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
