import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/core/utils/services/news_api_service.dart';
import 'package:news_app/features/screens/categories_details/widgets/news_item.dart';
import 'package:news_app/features/screens/categories_details/widgets/view_article_button.dart';
import 'package:news_app/features/screens/models/source_response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/helpers/build_bottom_sheet.dart';
import '../../models/news_response.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.sourceId,
  });
  final String sourceId;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<Article>> futureArticle;
  NewsApiService newsApiService = NewsApiService();
   ScrollController scrollController = ScrollController();
  int pageSize = 20;
  int page = 1;
  bool loadData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      futureArticle = newsApiService.getTopHeadLinesNews(widget.sourceId);
   scrollController.addListener(() {
     if(scrollController.position.maxScrollExtent == scrollController.offset) {
      WidgetsBinding.instance.addPostFrameCallback((_) => fetchData());
     }
   });
   setState(() {
     page++;
   });

  }
  Future<void> fetchData() async {
    setState(() {
      loadData = true;
    });
    futureArticle = newsApiService.getTopHeadLinesNews(widget.sourceId);
    loadData = false;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .sizeOf(context)
        .width;
    var height = MediaQuery
        .sizeOf(context)
        .height;
    return FutureBuilder(
      future: futureArticle,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          loadData = true;
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        } else if (snapshot.hasData) {
          loadData = false;
          var article = snapshot.data!;
        return ListView.separated(
          controller: scrollController,
            padding: EdgeInsets.only(bottom: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  buildShowBottomSheet(
                    context,
                    0.53 * height,
                    width - 35,
                    article: article[index],
                    launchUrl: () {
                      uriLauncher(article[index]);
                    }
                  );
                },
                child: NewsItem(article: article[index]),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: article.length,
          );
        } else {
          return Text('Error: ${snapshot.error}');
        }
      },
    );
  }
Future<void> uriLauncher(Article article) async {
    final Uri url = Uri.parse(article.url);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
 await launchUrl(url);
  }

}