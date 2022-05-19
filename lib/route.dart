import 'package:flutter/material.dart';
import 'package:news_app_testing/presentation/articles/articles_screen.dart';

const String article = '/';

Route<dynamic> controller(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case article:
      return MaterialPageRoute<ArticlesScreen>(
          builder: (context) => ArticlesScreen());

    default:
      throw Exception('This route name does not exit');
  }
}
