import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/core/utils/app_theme.dart';
import 'package:news_app/features/screens/categories_details/categories-details_content.dart';
import 'package:news_app/features/screens/home_screen.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homeRoute: (context) => HomeScreen(),
      },
      initialRoute: AppRoutes.homeRoute,
    );
  }
}