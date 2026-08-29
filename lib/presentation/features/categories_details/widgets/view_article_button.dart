import 'package:flutter/material.dart';
import 'package:news_app/presentation/core/utils/app_strings.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class ViewArticleButton extends StatelessWidget {
  const ViewArticleButton({
    super.key, required this.onPressed,
  });
    final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.onPrimaryDark,
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            fixedSize: Size(MediaQuery.sizeOf(context).width,56)
        ),
        child: Text(AppStrings.viewArticle,
          style: AppStyles.textStyle16Bold,));
  }
}
