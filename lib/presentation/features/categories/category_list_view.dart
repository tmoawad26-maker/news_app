import 'package:flutter/material.dart';


import '../../../data/models/category_model.dart';
import 'category_item.dart';

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
