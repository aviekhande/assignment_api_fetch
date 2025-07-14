import 'dart:developer';

import 'package:assignment_api/feature/home/data/repository/posts_repository.dart';
import 'package:assignment_api/feature/home/presentation/bloc/posts_event.dart';
import 'package:assignment_api/feature/home/presentation/bloc/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/posts_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;
  List<PostsModel> originalData = [];
  PostsBloc({required PostsRepository postsRepository})
    : _postsRepository = postsRepository,
      super(PostsInitState()) {
    on<PostsFetchEvent>(_onPostFetchEvent);
    on<PostsSearchEvent>(_onPostsSearchEvent);
  }
  _onPostFetchEvent(PostsFetchEvent event, Emitter<PostsState> emit) async {
    try {
      emit(PostsLoadingState());
      final resposeData = await _postsRepository.getPostsData();
      log("REspo $resposeData");
      originalData = resposeData ?? [];
      emit(PostsLoadedState(postsData: resposeData));
    } catch (e) {
      emit(PostsErrorState());
    }
  }

  _onPostsSearchEvent(PostsSearchEvent event, Emitter<PostsState> emit) async {
    if (originalData.isNotEmpty) {
      emit(PostsLoadingState());
      final filteredData = originalData
          .where(
            (e) =>
                e.title!.toLowerCase().contains(event.serachKey.toLowerCase()),
          )
          .toList();
      await Future.delayed(Duration(seconds: 2));
      emit(PostsLoadedState(postsData: filteredData));
    }
  }
}
