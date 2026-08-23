import 'package:flutter/material.dart';
import 'package:news_app/features/screens/widgets/setting_widget.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';
import '../models/category_model.dart';
import 'custom_list_tile.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key, required this.selectedCategory});
  final void Function()selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.onPrimaryDark),
            child: Center(
              child: Text(
                AppStrings.newsApp,
                style: Theme.of(context).textTheme.displayLarge
              ),
            ),
          ),
          CustomListTile(
            leading: Image.asset(Assets.homeIcon),
            title: Text(AppStrings.goToHome, style: AppStyles.textStyle20Bold),
            onTap: selectedCategory
          ),
          SizedBox(height: 24),
          Divider(indent: 20, endIndent: 20, color: AppColors.onPrimaryDark),
          SizedBox(height: 24),
          CustomListTile(
            leading: Image.asset(Assets.themeIcon),
            title: Text(AppStrings.theme, style: AppStyles.textStyle20Bold),
            onTap: () {},
          ),
          SizedBox(height: 8),
          SettingWidget(settingData: AppStrings.dark),
          SizedBox(height: 24),
          Divider(indent: 20, endIndent: 20, color: AppColors.onPrimaryDark),
          CustomListTile(
            leading: Image.asset(Assets.languageIcon),
            title: Text(AppStrings.language, style: AppStyles.textStyle20Bold),
            onTap: () {},
          ),
          SizedBox(height: 8),
          SettingWidget(settingData: AppStrings.english),
        ],
      ),
    );
  }
}
