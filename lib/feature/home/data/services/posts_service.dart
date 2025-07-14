import 'package:assignment_api/feature/home/data/api_client/posts_api_client.dart';
import 'package:assignment_api/feature/home/data/model/posts_model.dart';

class PostsService {
  final PostsApiClient _postsApiClient;
  PostsService({required PostsApiClient postsApiClient})
    : _postsApiClient = postsApiClient;
  Future<List<PostsModel>?> getPostsData() async {
    try {
      return await _postsApiClient.getPostsData();
    }  catch (e) {
      rethrow;
    }
  }
}
