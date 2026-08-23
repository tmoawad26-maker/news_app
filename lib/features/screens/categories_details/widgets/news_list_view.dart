import 'package:flutter/material.dart';
import 'package:news_app/core/utils/services/news_api_service.dart';
import 'package:news_app/features/screens/categories_details/widgets/news_item.dart';
import 'package:news_app/features/screens/models/source_response.dart';

import '../../models/news_response.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({
    super.key, required this.sources, required this.source,
  });
    final List<SourceModel> sources;
    final String source;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<List<Article>> futureArticle;
  NewsApiService newsApiService = NewsApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureArticle = newsApiService.getTopHeadLinesNews(widget.source);
  }
  @override
  Widget build(BuildContext context) {
   return  FutureBuilder(
      future: futureArticle,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator(color: Colors.blue,),);
          } else if(snapshot.hasData)
            {
              var article = snapshot.data!;
              return ListView.separated(
                  padding: EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                return NewsItem(article: article[index]);
              },
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: article.length);
            }
        else
          {
            return Text('Error: ${snapshot.error}');
          }
      },
    );

  }
}
