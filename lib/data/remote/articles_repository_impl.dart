import 'package:injectable/injectable.dart';
import 'package:news_app_testing/data/remote/api/articles_services.dart';
import 'package:news_app_testing/data/remote/model/article/articles_response_model.dart';
import 'package:news_app_testing/domain/repository/article_repository.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl extends ArticlesRepository {
  final ArticlesService articleService;

  ArticlesRepositoryImpl(this.articleService);

  @override
  Future<ArticlesResponseModel> getMostEmailedArticles() async {
    return await articleService.getMostEmailedArticles();
  }

  @override
  Future<ArticlesResponseModel> getMostViewedArticles() async {
    return await articleService.getMostViewedArticles();
  }

}