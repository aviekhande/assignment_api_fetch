import '../../data/model/posts_model.dart';

class PostsState {}
class PostsInitState extends PostsState{
  
}
class PostsLoadingState extends PostsState{
  
}
class PostsLoadedState extends PostsState{
  final List<PostsModel>? postsData;
  PostsLoadedState({required this.postsData});
}
class PostsErrorState extends PostsState{
  
}

