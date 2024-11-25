import 'package:flutter_bloc_first_project/src/data/models/post_model.dart';
import 'package:flutter_bloc_first_project/src/data/services/api_service.dart';

import '../../domain/repositories/post_repository.dart';


class PostRepositoryImpl implements PostRepository{

  final ApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<PostModel>> getPosts() async{
    final postList = await apiService.fetchPosts();
    return postList.map((post) => PostModel.fromJson(post)).toList();
  }
}


