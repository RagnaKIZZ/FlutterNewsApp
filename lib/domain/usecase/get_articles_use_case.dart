import 'package:injectable/injectable.dart';
import 'package:news_app_testing/data/remote/model/article/articles_response_model.dart';
import 'package:news_app_testing/domain/repository/article_repository.dart';
import '../../content_type.dart';

@singleton
class GetArticlesUseCase {
  final ArticlesRepository _repository;

  const GetArticlesUseCase(this._repository);

  Future<void> call({
    required ContentType contentType,
    required Function(ArticlesResponseModel?) onSuccess,
    required Function(Exception) onFailure,
  }) async {
    ArticlesResponseModel? _response;
    try {
      switch (contentType) {
        case ContentType.MostEmailed:
          _response = await _repository.getMostEmailedArticles();
          break;
        case ContentType.MostViewed:
          _response = await _repository.getMostViewedArticles();
          break;
        default:
          _response = await _repository.getMostViewedArticles();
          break;
      }
      onSuccess.call(_response);
    } on Exception catch (e) {
      onFailure.call(e);
    }
  }
}
