import 'package:injectable/injectable.dart';
import './end_project_provider.dart';
import 'package:news_app_testing/data/remote/model/article/articles_response_model.dart';

@singleton
class ArticlesService {
  final EndPointProvider _epProvider;

  ArticlesService(this._epProvider);

  Future<ArticlesResponseModel> getMostEmailedArticles() async =>
      _epProvider.getMostEmailedArticles();

  Future<ArticlesResponseModel> getMostViewedArticles() async =>
      _epProvider.getMostViewedArticles();
}
