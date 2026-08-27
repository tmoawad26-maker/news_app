import 'package:dio/dio.dart';
import 'package:news_app/core/utils/api_constant.dart';
import 'package:news_app/core/utils/dio_exception_handling.dart';
import 'package:news_app/core/utils/services/dio_client.dart';
import 'package:news_app/features/screens/models/news_response.dart';
import 'package:news_app/features/screens/models/source_response.dart';

class NewsApiService {
  Future<List<SourceModel>> getSources(String category) async {
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

  Future<List<Article>> getTopHeadLinesNews(String sourceId, {String? search}) async {
   RequestOptions requestOptions = RequestOptions(path: ApiConstant.topHeadlines);
   try {
     final response = await  DioClient.instance.get(
          requestOptions.path,
         queryParameters: {
           ApiConstant.sourcesKey : sourceId,
           ApiConstant.q: search
         }
     );
     final articleResponse = NewsResponse.fromJson(response.data);
     return articleResponse.articles ?? [];
   } catch(e) {
     if(e is DioException) {
       throw DioExceptionHandling.mapDioException(e, requestOptions);
     }
     throw Exception(e.toString());

  Future<List<Article>> getTopHeadLinesNews(
    String sourceId, {
    int? page,
    int ?limit,
    String? search,
  }) async {
    RequestOptions requestOptions = RequestOptions(
      path: ApiConstant.topHeadlines,
    );
    try {
      final response = await DioClient.instance.get(
        requestOptions.path,
        queryParameters: {
          ApiConstant.sourcesKey: sourceId,
          ApiConstant.page: page,
          ApiConstant.pageSize: limit,
          ApiConstant.q: search,
        },
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
