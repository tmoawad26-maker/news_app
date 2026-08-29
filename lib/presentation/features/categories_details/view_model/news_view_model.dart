import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/data/models/news_response.dart';
import 'package:news_app/data/services/news_api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewModel extends ChangeNotifier {
  List<Article>? articleList;
  bool isLoading = false;
  int page = 1;
  int pageSize = 20;
  String? errorMessage;
   String _fetchUrl = "";
  String get fetchUrl => _fetchUrl;
    ScrollController scrollController = ScrollController();
  getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      List<Article> articles = await NewsApiService.getTopHeadLinesNews(
        sourceId,
        page: page,
        pageSize: pageSize,
      );
      articleList = articles;
    } catch (e) {
      if (e is DioException) {
        errorMessage = e.message;
      }
      errorMessage = e.toString();
    }
    page++;
    isLoading = false;
    notifyListeners();
  }
    Future<void> launchStoreUrl(Article article) async {
    _fetchUrl = article.url;
    if(_fetchUrl != null) {
      Uri url = Uri.parse(_fetchUrl);
      if(await canLaunchUrl(url)) {
        await launchUrl(url);
      } else
        {
          throw Exception('Error: $url');
        }
      notifyListeners();
    }
    }
}
