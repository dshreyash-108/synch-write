import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collaborative Editor',
      home: LoginScreen(), // Start with the login screen
    );
  }
}
