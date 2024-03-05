import 'dart:io';
import 'package:web_socket_channel/io.dart';

void main() async {
  var server = await HttpServer.bind('localhost', 3000);
  print('WebSocket server listening on ${server.address.host}:${server.port}');

  server.listen((HttpRequest request) {
    // Upgrade the HttpRequest to a WebSocket connection.
    if (WebSocketTransformer.isUpgradeRequest(request)) {
      WebSocketTransformer.upgrade(request).then((WebSocket webSocket) {
        var channel = IOWebSocketChannel(webSocket);
        channel.stream.listen(
          (data) {
            print('Received message: $data');
            channel.sink.add('Echo: $data');
          },
          onDone: () {
            print('WebSocket closed');
          },
          onError: (error) {
            print('Error: $error');
          },
          cancelOnError: true,
        );
      });
    } else {
      // Handle non-WebSocket requests here.
      request.response
        ..statusCode = HttpStatus.badRequest
        ..write('WebSocket connections only');
      request.response.close();
    }
  });
}
