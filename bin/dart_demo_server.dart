import 'dart:convert';

import 'package:dart_demo_server/dart_demo_server.dart';
import 'dart:io';

Future main() async {
// #docregion bind
  var server = await HttpServer.bind(
    InternetAddress.anyIPv4,
    18080,
  );

  print('Listening on localhost:${server.port}');
  
  var store = BookStore();

  await for (HttpRequest request in server) {
    
    if (request.method == 'GET') {
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(store.getBooks()));
    } else if (request.method == 'POST') {
      var queries = request.uri.queryParameters;
      var newId = store.addBook(queries['name'], double.parse(queries['price']));
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(newId));
    } else if (request.method == 'DELETE') {
      var id = int.parse(request.uri.queryParameters['id']);
      store.deleteBook(id);
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(id));
    }
    
    await request.response.close();
  }
}
