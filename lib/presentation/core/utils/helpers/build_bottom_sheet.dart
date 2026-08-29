import 'package:flutter/material.dart';
import 'package:news_app/presentation/core/utils/app_strings.dart';
import '../../../../data/models/news_response.dart';
import '../../../features/categories_details/widgets/view_article_button.dart';
import '../app_assets.dart';
import '../app_colors.dart';
import '../app_styles.dart';


Future<dynamic> buildShowBottomSheet(
    BuildContext context,
    double height,
    double width, {
      required Article article,
      required void Function() launchUrl
    }) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.onPrimaryDark,
    useSafeArea: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: height, maxWidth: width),
    builder: (_) {
      // final Uri _uri = Uri.parse(article.url);
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.onPrimaryDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  article.urlToImage != null
                      ? article.urlToImage!
                      : Assets.placeholder,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                article.title ?? AppStrings.unKnown,
                style: AppStyles.textStyle14MediumBlack,
              ),
              ViewArticleButton(
                onPressed: launchUrl,
              ),
            ],
          ),
        ),
      );
    },
  );
}

