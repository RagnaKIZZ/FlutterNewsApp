import 'package:news_app_testing/data/remote/model/article/articles_response_model.dart';

abstract class ArticlesRepository {
  Future<ArticlesResponseModel> getMostEmailedArticles();
  Future<ArticlesResponseModel> getMostViewedArticles();
}
