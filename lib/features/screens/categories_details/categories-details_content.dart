import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/core/utils/services/news_api_service.dart';
import 'package:news_app/features/screens/categories_details/widgets/news_list_view.dart';
import 'package:news_app/features/screens/models/category_model.dart';
import 'package:news_app/features/screens/models/source_response.dart';
class CategoriesDetailsContent extends StatefulWidget {
  const CategoriesDetailsContent({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoriesDetailsContent> createState() => _CategoriesDetailsContentState();
}

class _CategoriesDetailsContentState extends State<CategoriesDetailsContent> {
  final  newsApiService = NewsApiService();
late Future<List<SourceModel>> futureSources;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSources = newsApiService.getSources(widget.categoryModel.id);
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
   return  FutureBuilder(
      future: futureSources,
      builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }
          else if(snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          else
            {
              var  sources = snapshot.data;
            return   DefaultTabController(
                length: sources!.length,
                child: Scaffold(
                  appBar: AppBar(
                    bottom:
                    TabBar(
                        labelStyle: AppStyles.textStyle16Bold,
                        dividerHeight: 0,
                        isScrollable: true,
                        padding: EdgeInsets.only(bottom: 19.5),
                        tabAlignment: TabAlignment.start,
                        labelColor: AppColors.onPrimaryDark,
                        tabs: sources.map((source) => Tab(text: source.name,)).toList()
                    ),
                  ),
                  body: TabBarView(
                      children: [
                    ...sources.map((source) => NewsListView(sources: sources,
                      sourceId: source.id!,)),
                  ]),
                ),
              );
            }
      },
    );
  }
}

