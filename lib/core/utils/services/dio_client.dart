import 'package:dio/dio.dart';
import 'package:news_app/core/utils/api_constant.dart';
import 'package:news_app/core/utils/services/api_key_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient
{
  static Dio?_dio;
  /// get instance of dio
  /// use that instance of entire of application
  static Dio get instance {
    _dio ??= _getDio();
    return _dio!;
  }
  /// Handle configuration of Dio(Request)
    static Dio _getDio() {
      final dio = Dio(
        BaseOptions(
            baseUrl: ApiConstant.baseUrl,
            )
      );
      dio.interceptors.addAll(
          [
            PrettyDioLogger(request: true, responseBody: true),
          ApiKeyInterceptor()
          ]);
    return dio;
  }
}