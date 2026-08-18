import 'package:flutter/material.dart';
import 'package:news_app/features/screens/models/category_model.dart';
import 'package:news_app/features/screens/widgets/view_all_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categoryModel,
    required this.isLeft,
  });
  final CategoryModel categoryModel;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      height: .25 * height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondaryDark,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: isLeft ? .topStart : .topEnd,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(categoryModel.imagePath,),
          ),
          Positioned(
            left: isLeft ? null : 30,
            right: isLeft ? 30 : null,
            top: 30,
            child: Text(
              categoryModel.title,
              style: AppStyles.textStyle24Medium.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
          ),
          Positioned(
              bottom: 16,
              right: isLeft ? 16 : null,
              left: isLeft ? null : 16,
              child: ViewAllWidget(isEven: isLeft,)),
        ],
      ),
    );
  }
}
