import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_testing/content_type.dart';
import 'package:news_app_testing/domain/usecase/get_articles_use_case.dart';
import 'package:news_app_testing/presentation/articles/state/articles_state.dart';

class ArticlesMostCubit extends Cubit<ArticlesState> {
  ArticlesMostCubit() : super(const ArticlesInitialState());

  void getArticles(ContentType contentType) {
    emit(const ArticlesStateLoading());
    GetIt.instance<GetArticlesUseCase>().call(
      contentType: contentType,
      onSuccess: (response) {
        emit(ArticlesStateLoaded(response));
      },
      onFailure: (err) {
        emit(ArticlesStateFailure(err));
      },
    );
  }
}
