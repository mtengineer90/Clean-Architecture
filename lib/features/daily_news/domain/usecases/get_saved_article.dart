import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void>{

  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}){
    return _articleRepository.getSavedArticles();
  }
}