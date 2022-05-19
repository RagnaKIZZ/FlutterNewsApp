// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/api/api_service.dart' as _i9;
import '../data/remote/api/articles_services.dart' as _i5;
import '../data/remote/api/end_project_provider.dart' as _i4;
import '../data/remote/articles_repository_impl.dart' as _i7;
import '../domain/repository/article_repository.dart' as _i6;
import '../domain/usecase/get_articles_use_case.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiService = _$ApiService();
  gh.singleton<_i3.Dio>(apiService.init());
  gh.singleton<_i4.EndPointProvider>(_i4.EndPointProvider(get<_i3.Dio>()));
  gh.singleton<_i5.ArticlesService>(
      _i5.ArticlesService(get<_i4.EndPointProvider>()));
  gh.factory<_i6.ArticlesRepository>(
      () => _i7.ArticlesRepositoryImpl(get<_i5.ArticlesService>()));
  gh.singleton<_i8.GetArticlesUseCase>(
      _i8.GetArticlesUseCase(get<_i6.ArticlesRepository>()));
  return get;
}

class _$ApiService extends _i9.ApiService {}
