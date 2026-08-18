import 'package:flutter/material.dart';
import 'package:news_app/features/screens/widgets/category_widget.dart';

import '../models/category_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context , index) {
          return CategoryWidget(categoryModel: CategoryModel.categories[index],
          isLeft: index % 2 == 0,
          );
        },
        separatorBuilder: (context, index) {
         return  SizedBox(height: 16,);
        },
        itemCount: CategoryModel.categories.length);
  }
}
