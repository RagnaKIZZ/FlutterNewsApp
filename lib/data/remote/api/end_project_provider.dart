import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../model/article/articles_response_model.dart';

@singleton
class EndPointProvider {
  final Dio _dio;
  final String _apiKey = 'NutysAnjr0pkMh3KAN5dL5L7ssorFSg1';

  const EndPointProvider(this._dio);

  Future<ArticlesResponseModel> getMostEmailedArticles() async {
    try {
      final response = await _dio.get(
        'mostpopular/v2/emailed/7.json',
        queryParameters: {"api-key": _apiKey},
      );
      return ArticlesResponseModel.fromJson(json.decode(response.toString()));
    } on DioError catch (err) {
      developer.log(err.message.toString());
      throw Exception(err.message);
    }
  }

  Future<ArticlesResponseModel> getMostViewedArticles() async {
    try {
      final response = await _dio.get(
        'mostpopular/v2/viewed/7.json',
        queryParameters: {"api-key": _apiKey},
      );
      return ArticlesResponseModel.fromJson(json.decode(response.toString()));
    } on DioError catch (err) {
      developer.log(err.message.toString());
      throw Exception(err.message);
    }
  }
}
