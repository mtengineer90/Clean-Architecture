import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../domain/usecases/get_article.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
    on <GetArticlesEvent> (onGetArticles);
  }

  void onGetArticles(GetArticlesEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticlesDone(dataState.data!));
    }

    if(dataState is DataFailed){
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}