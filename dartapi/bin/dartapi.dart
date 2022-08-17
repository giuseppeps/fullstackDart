import 'dart:convert';
import 'dart:io';

import 'package:dartapi/dartapi.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final app = Router();

  app.mount('/films', FilmApi().router);
  //! Parâmetro obrigatório
  // app.get('/<name>', (Request request, String name) {
  //   return Response.ok('hello $name');
  // });

  //! Parâmetro não obrigatório
  // app.get('/<name|.*>', (Request request, String name) {
  //   final param = name.isNotEmpty ? name : 'Unknown';
  //   return Response.ok('Hello $param');
  // });

  await io.serve(app, 'localhost', 3000);
}
