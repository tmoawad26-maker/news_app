import 'package:flutter/material.dart';
import '../../../../data/models/news_response.dart';
import '../../../../data/models/source_response.dart';
import '../../../../data/services/news_api_service.dart';
import 'news_item.dart';

class NewsListViewSearch extends StatefulWidget {
  const NewsListViewSearch({
    super.key,
    required this.sourceModel, required this.search,
  });
  final SourceModel sourceModel;
  final String search;
  @override
  State<NewsListViewSearch> createState() => _NewsListViewSearchState();
}

class _NewsListViewSearchState extends State<NewsListViewSearch> {
  late Future<List<Article>> articles;
  NewsApiService  newsApiService = NewsApiService();
  List<Article> articleList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articles = NewsApiService.getTopHeadLinesNews(widget.sourceModel.id ?? "",
        search: widget.search);
    setState(() {
      searchData();
    });
  }
  Future<void> searchData() async {
    articleList = await articles;
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
              return NewsItem(article: articleList[index],);
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: articleList.length,
          );
        }
        else {
          return Text('Error: ${snapshot.error}');
        }
        },
    );
  }
}
