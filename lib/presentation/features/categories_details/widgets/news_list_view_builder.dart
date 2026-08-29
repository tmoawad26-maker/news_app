import 'package:flutter/material.dart';
import 'package:news_app/presentation/core/utils/app_colors.dart';
import 'package:news_app/presentation/features/categories_details/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/helpers/build_bottom_sheet.dart';
import 'news_item.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel()..getNews(sourceId),
      child: Consumer<NewsViewModel>(
        builder: (_, newsState, _) {
          if (newsState.isLoading) {
            return Center(child: CircularProgressIndicator(
              color: AppColors.loadingIndicator,
            ));
          } else if (newsState.errorMessage != null) {
            return Text('Error: ${newsState.errorMessage}');
          } else {
            var article = newsState.articleList!;
            return ListView.separated(
              padding: EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    buildShowBottomSheet(
                      context,
                      height*.53,
                      width - 35,
                      article: article[index],
                      launchUrl: () {
                        newsState.launchStoreUrl(article[index]);
                      },
                    );
                  },
                  child: NewsItem(article: article[index]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: article.length,
            );

          }

        },
      ),
    );

  }
}
