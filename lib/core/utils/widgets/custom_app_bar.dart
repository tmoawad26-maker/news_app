import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets.dart';
import '../app_strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.home, style: theme.appBarTheme.titleTextStyle),
      actionsPadding: theme.appBarTheme.actionsPadding,
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 16),
            child: SvgPicture.asset(Assets.searchIcon)
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}