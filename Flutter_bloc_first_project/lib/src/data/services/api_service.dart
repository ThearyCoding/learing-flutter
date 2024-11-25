import 'dart:convert';
import 'package:flutter_bloc_first_project/src/core/constant.dart';
import 'package:http/http.dart' as http;


class ApiService{

  Future<List<dynamic>> fetchPosts() async{
    final response =await http.get(Uri.parse('$baseUrl/posts'));

    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    else{
      return throw Exception("Failed to load posts");
    }
  }
}