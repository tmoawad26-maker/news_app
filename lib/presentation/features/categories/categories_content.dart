import 'package:flutter/material.dart';


import '../../../data/models/category_model.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/app_styles.dart';
import 'category_item.dart';
class CategoriesContent extends StatelessWidget {
  const CategoriesContent({super.key, required this.categoryClicked});
    final void Function(CategoryModel) categoryClicked;
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
            style: AppStyles.textStyle24BoldWhite,
          ),
          SizedBox(height: 16,),
          Expanded(child:  ListView.separated(
              itemBuilder: (context , index) {
                return InkWell(
                  onTap: () {
                    categoryClicked(CategoryModel.categories[index]);
                  },
                  child: CategoryItem(categoryModel: CategoryModel.categories[index],
                    isLeft: index % 2 == 0,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return  SizedBox(height: 16,);
              },
              itemCount: CategoryModel.categories.length))
        ],
      ),
    );
  }
}

