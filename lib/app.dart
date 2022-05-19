import 'package:flutter/material.dart';
import 'package:news_app_testing/route.dart' as route;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'News App Testing',
      onGenerateRoute: route.controller,
      initialRoute: route.article,
    );
  }
}
