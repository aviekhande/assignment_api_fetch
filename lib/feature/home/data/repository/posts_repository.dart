import 'package:assignment_api/feature/home/data/services/posts_service.dart';

import '../model/posts_model.dart';

class PostsRepository {
  final PostsService _postsService;
  PostsRepository({required PostsService postsService})
    : _postsService = postsService;
  Future<List<PostsModel>?> getPostsData() async {
    try {
      return await _postsService.getPostsData();
    } catch (e) {
      rethrow;
    }
  }
}
