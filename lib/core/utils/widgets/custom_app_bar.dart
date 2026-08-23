import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../features/screens/models/category_model.dart';
import '../app_assets.dart';
import '../app_strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.bottom,
    this.appBarHeight,
    this.selectedCategory,
  });
  final CategoryModel? selectedCategory;

  final PreferredSizeWidget? bottom;
  final double? appBarHeight;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      toolbarHeight: appBarHeight,
      title: Text(
        selectedCategory == null ? AppStrings.home : selectedCategory!.title,
        style: theme.appBarTheme.titleTextStyle,
      ),
      actionsPadding: theme.appBarTheme.actionsPadding,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: SvgPicture.asset(Assets.searchIcon),
        ),
      ],
      bottom: bottom,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}
