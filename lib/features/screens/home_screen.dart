import 'package:flutter/material.dart';
import 'package:news_app/features/screens/categories/categories_content.dart';
import 'package:news_app/features/screens/categories_details/categories-details_content.dart';
import 'package:news_app/features/screens/models/category_model.dart';
import 'package:news_app/features/screens/widgets/custom_drawer_widget.dart';
import '../../core/utils/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerWidget(selectedCategory: goToHome),
      appBar: CustomAppBar(selectedCategory: selectedCategory),
      body: selectedCategory == null
          ? CategoriesContent(categoryClicked: categoryItemClicked)
          : CategoriesDetailsContent(categoryModel: selectedCategory!,),
    );
  }

  CategoryModel? selectedCategory;
  categoryItemClicked(CategoryModel category) {
    setState(() {
      selectedCategory = category;
    });
  }

  goToHome() {
    setState(() {
      selectedCategory = null;
    });
    Navigator.pop(context);
  }
}
