import 'package:flutter/material.dart';
import 'package:news_app/presentation/core/widgets/custom_drawer_widget.dart';

import '../../../data/models/category_model.dart';
import '../../../data/widgets/custom_app_bar.dart';
import '../categories/categories_content.dart';
import '../categories_details/screens/categories-details_content.dart';

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
