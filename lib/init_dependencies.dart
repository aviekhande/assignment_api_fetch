import 'package:assignment_api/feature/home/data/api_client/posts_api_client.dart';
import 'package:assignment_api/feature/home/data/repository/posts_repository.dart';
import 'package:assignment_api/feature/home/data/services/posts_service.dart';
import 'package:assignment_api/feature/home/presentation/bloc/posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void initDependencies() {
  serviceLocator.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com')),
  );

  initPosts();
}

initPosts() {
  serviceLocator.registerLazySingleton(
    () => PostsApiClient(dio: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => PostsService(postsApiClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => PostsRepository(postsService: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => PostsBloc(postsRepository: serviceLocator()),
  );
}
