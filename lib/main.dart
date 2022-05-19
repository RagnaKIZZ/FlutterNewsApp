import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_testing/app.dart';
import 'package:news_app_testing/presentation/articles/state/articles_cubit.dart';
import 'package:news_app_testing/presentation/articles/state/articles_most_viewed_cubit.dart';
import 'package:news_app_testing/presentation/bloc/bloc_observer.dart';
import './di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  BlocOverrides.runZoned(
      () => runApp(MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ArticlesCubit()),
              BlocProvider(create: (_) => ArticlesMostCubit())
            ],
            child: App(),
          )),
      blocObserver: CubitObserver());
}
