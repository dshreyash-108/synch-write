import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class CollaborativeEditorPage extends StatefulWidget {
  @override
  _CollaborativeEditorPageState createState() =>
      _CollaborativeEditorPageState();
}

class _CollaborativeEditorPageState extends State<CollaborativeEditorPage> {
  final TextEditingController _textController = TextEditingController();
  late IOWebSocketChannel _channel;

  @override
  void initState() {
    super.initState();

    // Replace 'http://your_backend_url' with your actual backend WebSocket server URL
    _channel = IOWebSocketChannel.connect('ws://localhost:3000');

    // Listen for text changes from the server
    _channel.stream.listen(
      (data) {
        setState(() {
          _textController.text = data;
        });
      },
      onDone: () {
        print('WebSocket closed');
      },
      onError: (error) {
        print('Error: $error');
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collaborative Text Editor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: TextField(
            controller: _textController,
            onChanged: (text) {
              // Send the text changes to the server
              _channel.sink.add(text);
            },
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Start writing collaboratively...',
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close(); // Close the WebSocket connection
    super.dispose();
  }
}

              
              // Send the text changes
