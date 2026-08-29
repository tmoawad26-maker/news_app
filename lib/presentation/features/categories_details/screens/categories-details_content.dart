import 'package:flutter/material.dart';
import 'package:news_app/presentation/features/categories_details/view_model/source_view_model.dart';
import 'package:news_app/presentation/features/categories_details/widgets/news_list_view_builder.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/category_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CategoriesDetailsContent extends StatelessWidget {
  const CategoriesDetailsContent({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) =>
          SourceViewModel()..getSources(category: categoryModel.id),
      child: Consumer<SourceViewModel>(
        builder: (_, sourceState, _) {
          if (sourceState.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (sourceState.errorMessage != null) {
            return Text('Error: ${sourceState.errorMessage}');
          } else {
            var sources = sourceState.sources ?? [];
            return DefaultTabController(
              length: sources.length,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    labelStyle: AppStyles.textStyle16Bold,
                    dividerHeight: 0,
                    isScrollable: true,
                    padding: EdgeInsets.only(bottom: 19.5),
                    tabAlignment: TabAlignment.start,
                    labelColor: AppColors.onPrimaryDark,
                    tabs: sources
                        .map((source) => Tab(text: source.name))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  children: [
                    ...sources.map(
                      (source) => NewsListViewBuilder(sourceId: source.id!),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
