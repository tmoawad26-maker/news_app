import 'package:flutter/material.dart';
import 'package:news_app/presentation/features/categories_details/widgets/custom_search_field.dart';
import 'package:news_app/presentation/features/categories_details/widgets/news_list_view_search.dart';

import '../../../../data/models/category_model.dart';
import '../../../../data/models/news_response.dart';
import '../../../../data/models/source_response.dart';
import '../../../../data/services/news_api_service.dart';

class SearchCategoryScreen extends StatefulWidget {
  const SearchCategoryScreen({super.key});

  @override
  State<SearchCategoryScreen> createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {
 late List<Article> articles;
  SourceModel sourceModel = SourceModel();
  NewsApiService newsApiService = NewsApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articles = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: Column(
            children: [
              CustomSearchField(onChanged: onArticleSearched),
              Expanded(
                child: NewsListViewSearch(
                  search: categoryModel != null ? categoryModel!.id :
                  "No Result Data",
                  sourceModel: sourceModel,)
              )
            ],
          ),
        ),
      ),
    );
  }
    CategoryModel? categoryModel;
  onArticleSearched(String? articleSearch) {
    articles = articles.where((article) {
      return article.source!.id!.contains(articleSearch!);
    }).toList();
    setState(() {

    });
  }
}
