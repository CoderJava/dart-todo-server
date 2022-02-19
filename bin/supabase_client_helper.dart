import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

class SupabaseClientHelper {
  static const supabaseUrl = 'https://cvggebzlbkbdjhyksggi.supabase.co';
  static const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2Z2dlYnpsYmtiZGpoeWtzZ2dpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDUyMzc2NDAsImV4cCI6MTk2MDgxMzY0MH0.PBHqDsxhwBFPx5lVUigrocngHmVP45AEqRU27wcBwqI';
  static SupabaseClient client = SupabaseClient(supabaseUrl, supabaseKey);
  static const todoTableName = 'todo_table';

  static Future<Response> getAllTodo() async {
    final response = await client.from(todoTableName).select().execute();
    final map = {
      'todos': response.data,
    };
    return Response.ok(jsonEncode(map));
  }

  static Future<Response> createTodo(Map<String, dynamic> body) async {
    final response = await client.from(todoTableName).insert(body).execute();
    return Response.ok(jsonEncode(response.data));
  }
}