import 'package:flutter/material.dart';
import 'package:news_app/presentation/core/utils/app_routes.dart';


import 'package:news_app/presentation/core/utils/app_theme.dart';
import 'package:news_app/presentation/features/categories_details/screens/search_category_screen.dart';
import 'package:news_app/presentation/features/home/home_screen.dart';


class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homeRoute: (context) => HomeScreen(),
        AppRoutes.searchRoute: (context) => SearchCategoryScreen()
      },
      initialRoute: AppRoutes.homeRoute,
    );
  }
}