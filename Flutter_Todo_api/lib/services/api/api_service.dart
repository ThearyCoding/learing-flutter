
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_todo_api/core/constants.dart';
import 'package:flutter_todo_api/models/todo_model.dart';

enum DioMethod { post, get, put, delete }

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();

  Future<Response> request(
      String endpoint,
      DioMethod method,
      Map<String, dynamic> param,
      String? contentType,
      formData,
      ) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer token',
          },
        ),
      );

      switch (method) {
        case DioMethod.post:
          return await dio.post(endpoint, data: param ?? formData);
        case DioMethod.get:
          return await dio.get(endpoint, queryParameters: param);
        case DioMethod.put:
          return await dio.put(endpoint, data: param ?? formData);
        case DioMethod.delete:
          return await dio.delete(endpoint, data: param ?? formData);
        default:
          return await dio.post(endpoint, data: param ?? formData);
      }
    } catch (e) {
      log('Network error: $e');
      throw Exception('Network error: $e');
    }
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await ApiService.instance.request(
      todos,
      DioMethod.get,
      {},
      null,
      null,
    );

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> jsonData = response.data as List<dynamic>;

      return jsonData.map((todo) => TodoModel.fromJson(todo)).toList();
    } else {
      log('Failed to load todos: ${response.statusCode}, ${response.data}');
      throw Exception('Failed to load todos: ${response.statusCode}');
    }
  }

  Future<void> createTodo(TodoModel todo) async {
    final response = await request(
      'todos',
      DioMethod.post,
      {
        'title': todo.title,
      },
      Headers.jsonContentType,
      null,
    );

    if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
      log('Add Todo Successful');
    } else {
      log('Failed to create todo: ${response.statusCode}, ${response.data}');
      throw Exception('Failed to create todo: ${response.statusCode}, Response: ${response.data}');
    }
  }

}
