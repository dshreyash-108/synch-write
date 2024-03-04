import 'package:flutter/material.dart';

class EditorScreen extends StatefulWidget {
  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collaborative Editor'),
      ),
      body: Center(
        child: Text('Welcome to the Editor!'),
      ),
    );
  }
}
