import 'package:dio/dio.dart';

import '../models/news_response.dart';
import '../models/source_response.dart';
import 'api_constant.dart';
import 'dio_client.dart';
import 'dio_exception_handling.dart';

class NewsApiService {
 static Future<List<SourceModel>> getSources(String category) async {
    RequestOptions requestOptions = RequestOptions(path: ApiConstant.sources);
    try {
      Response response = await DioClient.instance.get(
        requestOptions.path,
        queryParameters: {ApiConstant.category: category},
      );
      final sourceResponse = SourceResponse.fromJson(response.data);
      return sourceResponse.sources ?? [];
    } catch (e) {
      throw DioExceptionHandling.mapDioException(e, requestOptions);
    }
  }

 static Future<List<Article>> getTopHeadLinesNews(String sourceId, {String? search,
    int?page, int?pageSize}) async {
    RequestOptions requestOptions = RequestOptions(
        path: ApiConstant.topHeadlines);
    try {
      final response = await DioClient.instance.get(
          requestOptions.path,
          queryParameters: {
            ApiConstant.sourcesKey: sourceId,
            ApiConstant.q: search,
            ApiConstant.pageSize: pageSize,
            ApiConstant.page: page
          }
      );
      final articleResponse = NewsResponse.fromJson(response.data);
      return articleResponse.articles ?? [];
    } catch (e) {
      if (e is DioException) {
        throw DioExceptionHandling.mapDioException(e, requestOptions);
      }
      throw Exception(e.toString());
    }
  }
}