import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_testing/content_type.dart';
import 'package:news_app_testing/presentation/articles/state/articles_most_viewed_cubit.dart';
import 'package:news_app_testing/presentation/articles/state/articles_state.dart';
import 'package:news_app_testing/presentation/articles/widget/artcles_item.dart';

class MostViewedArticles extends StatefulWidget {
  const MostViewedArticles({Key? key}) : super(key: key);

  @override
  State<MostViewedArticles> createState() => _MostViewedArticlesState();
}

class _MostViewedArticlesState extends State<MostViewedArticles> {
  late ArticlesMostCubit _articlesCubit;

  @override
  void initState() {
    super.initState();
    _articlesCubit = BlocProvider.of<ArticlesMostCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    _articlesCubit.getArticles(ContentType.MostViewed);
    return BlocBuilder<ArticlesMostCubit, ArticlesState>(
        bloc: _articlesCubit,
        builder: (ctx, state) {
          if (state is ArticlesStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ArticlesStateFailure) {
            return const SizedBox(
              width: double.infinity,
              child: Text('Something Wrong!!'),
            );
          } else if (state is ArticlesStateLoaded) {
            return Container(
              height: 200,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: state.response!.results.length,
                itemBuilder: (BuildContext context, int index) {
                  return ArticlesItem(state.response!.results[index]);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}
