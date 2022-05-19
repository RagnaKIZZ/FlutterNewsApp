import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_testing/content_type.dart';
import 'package:news_app_testing/presentation/articles/widget/artcles_item.dart';
import 'package:news_app_testing/presentation/articles/state/articles_cubit.dart';
import 'package:news_app_testing/presentation/articles/state/articles_state.dart';
import 'package:news_app_testing/presentation/articles/widget/most_emailed_articles.dart';
import 'package:news_app_testing/presentation/articles/widget/most_viewed_articles.dart';

class ArticlesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text('Most Emailed Articles'),
          ),
          const MostEmailedArticles(),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text('Most Viewed Articles'),
          ),
          const MostViewedArticles(),
        ],
      )
    );
  }
  
}
