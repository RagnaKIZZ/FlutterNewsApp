import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiService {
  @singleton
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptor());
    _dio.options.baseUrl = "https://api.nytimes.com/svc/";
    return _dio;
  }
}

class ApiInterceptor extends Interceptor {
  Logger log = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.d('REQUEST');
    log.d('REQUEST[${options.method}] => PATH: ${options.path}');
    log.d('REQUEST[${options.toString()}]');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d('RESPONSE');
    log.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    log.v(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    log.e('ERROR[${err.response?.toString()}]');
    return super.onError(err, handler);
  }
}
