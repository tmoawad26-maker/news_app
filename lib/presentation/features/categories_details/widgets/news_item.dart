import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

import '../../../core/utils/app_assets.dart';
import '../../../../data/models/news_response.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onPrimaryDark),
      ),
      child: Column(
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.network(
                article.urlToImage != null ?  article.urlToImage!
                    : Assets.imagesNewsPlaceholder,
                fit: BoxFit.cover)
          ),
          Text(article.title ?? "Unknown", style: AppStyles.textStyle16Bold),
          Row(
            children: [
              Flexible(
                child: Text(
                  'By : ${article.author ?? "Unknown"}',
                  style: AppStyles.textStyle12Medium.copyWith(
                    color: AppColors.newsInfoDark,
                  ),
                ),
              ),
              Spacer(),
              Text(
                article.publishedAt == null
                    ? "UnKnown"
                    : "Date: ${formattedData(article.publishedAt!)}",
                style: AppStyles.textStyle12Medium.copyWith(
                  color: AppColors.newsInfoDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formattedData(String timeStamp) {
    var convertedTimestamp = DateTime.parse(
      timeStamp,
    ); // Converting into [DateTime] object
    var result = GetTimeAgo.parse(convertedTimestamp);
    return result;
  }
}
