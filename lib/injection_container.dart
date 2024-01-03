

import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {

  //Dio
  serviceLocator.registerSingleton<Dio>(Dio());

  //Dependencies
  serviceLocator.registerSingleton<NewsApiService>(NewsApiService(serviceLocator()));

  serviceLocator.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(serviceLocator())
  );

  //UseCases
  serviceLocator.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(serviceLocator())
  );

  //BLoCs
  serviceLocator.registerFactory<RemoteArticleBloc>(
      () => RemoteArticleBloc(serviceLocator())
  );



}