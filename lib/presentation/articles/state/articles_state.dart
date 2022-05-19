import 'package:equatable/equatable.dart';
import 'package:news_app_testing/data/remote/model/article/articles_response_model.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object?> get props => [];
}

class ArticlesInitialState extends ArticlesState {
  const ArticlesInitialState();
}

class ArticlesStateLoading extends ArticlesState {
  const ArticlesStateLoading();
}

class ArticlesStateFailure extends ArticlesState {
  final Exception err;

  const ArticlesStateFailure(this.err);
}

class ArticlesStateLoaded extends ArticlesState {
  final ArticlesResponseModel? response;
  const ArticlesStateLoaded(this.response);

  @override
  String toString() {
    return 'ArticlesResponse: ${response.toString()}';
  }
}
