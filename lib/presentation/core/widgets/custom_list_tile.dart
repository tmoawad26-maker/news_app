import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, this.leading, this.title, this.onTap,
  });
  final Widget? leading , title;
  final VoidCallback?onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.primaryDark,
      leading: leading,
      title: title,
      onTap: onTap,
    );
  }
}
