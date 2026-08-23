import 'package:dio/dio.dart';
import 'package:news_app/core/utils/api_constant.dart';

class ApiKeyInterceptor extends   Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
   options.headers["X-Api-Key"] =  ApiConstant.apiKey;
   handler.next(options);
  }



}