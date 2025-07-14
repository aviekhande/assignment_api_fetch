import 'dart:developer';

import 'package:assignment_api/feature/home/data/model/posts_model.dart';
import 'package:dio/dio.dart';

class PostsApiClient {
  final Dio _dio;
  PostsApiClient({required Dio dio}) : _dio = dio;

  Future<List<PostsModel>?> getPostsData() async {
    try {
      final response = await _dio.get(
        '/products',
      );
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => PostsModel.fromJson(e)).toList();
      }
    } catch (e) {
      log("$e");
      throw Exception("Unknown Error");
    }
    return null;
  }
}
