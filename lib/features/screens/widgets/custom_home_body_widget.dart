import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/features/screens/widgets/category_list_view.dart';

import '../../../core/utils/app_assets.dart';
import 'category_widget.dart';

class CustomHomeBodyWidget extends StatelessWidget {
  const CustomHomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.goodMorning}\n${AppStrings.newsHere}',
            style: AppStyles.textStyle24Medium,
          ),
          SizedBox(height: 16,),
          Expanded(child: CategoryListView())
        ],
      ),
    );
  }
}

