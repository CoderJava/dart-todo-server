import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'supabase_client_helper.dart';

class Service {
  static Handler get handler {
    final router = Router();

    router.get('/all-todo', (Request request) async {
      return await SupabaseClientHelper.getAllTodo();
    });

    /*router.post('/create-todo', (Request request) async {
      final strRequest = await request.readAsString();
      Map<String, dynamic> body = jsonDecode(strRequest);
      return SupabaseClientHelper.createTodo(body);
    });*/

    router.all('/<ignored|.*>', (Request request) async {
      return Response.notFound('Page not found');
    });

    return router;
  }
}