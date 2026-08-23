import 'package:flutter/material.dart';
import 'package:news_app/features/screens/categories/category_item.dart';

import '../../../core/utils/app_routes.dart';
import '../models/category_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categoryClicked});
    final void Function(CategoryModel) categoryClicked;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context , index) {
          return InkWell(
            onTap: () {
             categoryClicked;
            },
            child: CategoryItem(categoryModel: CategoryModel.categories[index],
            isLeft: index % 2 == 0,
            ),
          );
        },
        separatorBuilder: (context, index) {
         return  SizedBox(height: 16,);
        },
        itemCount: CategoryModel.categories.length);
  }
}
