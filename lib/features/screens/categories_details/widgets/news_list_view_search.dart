import 'package:flutter/material.dart';
import 'package:news_app/core/utils/services/news_api_service.dart';
import 'package:news_app/features/screens/models/source_response.dart';

import '../../models/news_response.dart';
import 'news_item.dart';

class NewsListViewSearch extends StatefulWidget {
  const NewsListViewSearch({
    super.key,
    required this.sourceModel,
  });
  final SourceModel sourceModel;
  @override
  State<NewsListViewSearch> createState() => _NewsListViewSearchState();
}

class _NewsListViewSearchState extends State<NewsListViewSearch> {
  late Future<List<Article>> articles;
  NewsApiService  newsApiService = NewsApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articles = newsApiService.getTopHeadLinesNews(widget.sourceModel.id ?? "");
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: articles,
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasData) {
        var  article = snapshot.data!;
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(article: article[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: article.length,
          );
        }
        else {
          return Text('Error: ${snapshot.error}');
        }
        },
    );
  }
}
