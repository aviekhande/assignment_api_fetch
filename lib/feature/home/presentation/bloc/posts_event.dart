class PostsEvent {

}

class PostsFetchEvent extends PostsEvent{

}
class PostsSearchEvent extends PostsEvent{
  final String serachKey;
  PostsSearchEvent({required this.serachKey});
}

class PostsResetEvent extends PostsEvent{
  
}