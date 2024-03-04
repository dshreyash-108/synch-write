import 'package:flutter/material.dart';
import 'editor_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your authentication logic here
                if (_usernameController.text == 'shreyash' &&
                    _passwordController.text == '123') {
                  // Successful login (for now, just a placeholder)
                  print('Login Successful');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EditorScreen()),
                  );
                  // Navigate to the main document editing screen
                } else {
                  // Invalid credentials
                  print('Invalid username or password');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
