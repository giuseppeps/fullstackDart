import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class FilmApi {
  final List data = json.decode(File('path.json').readAsStringSync());

  Router get router {
    final router = Router();

    //! Retorna json
    router.get('/', (Request request) {
      return Response.ok(json.encode(data),
          headers: {'Content-Type': 'application/json'});
    });

    //! Retorna elemento do json ou mensagem de erro
    router.get('/<id|[0-9]+>', (Request request, String id) {
      final parseId = int.tryParse(id);
      final film = data.firstWhere((element) => element['id'] == parseId,
          orElse: () => null);

      if (film != null)
        return Response.ok(json.encode(film),
            headers: {'Content-Type': 'application/json'});
      return Response.notFound('not found');
    });

    //! Cria json
    router.post('/', (Request request) async {
      final payload = await request.readAsString();
      data.add(json.decode(payload));

      return Response.ok(payload,
          headers: {'Content-Type': 'application/json'});
    });

    //! Deleta elemento do json ou mensagem de erro
    router.delete('/<id>', (Request request, String id) {
      final parseId = int.tryParse(id);
      data.removeWhere((element) => element['id'] == parseId);

      return Response.ok('Deleted');
    });

    return router;
  }
}
