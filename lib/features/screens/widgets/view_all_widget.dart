import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({
    super.key, required this.isEven,
  });
  final   bool isEven;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(84),
      ),
      child: Row(
        textDirection: isEven ? .ltr : .rtl,
        children: [
          Spacer(),
          Text(
            AppStrings.viewAll,
            style: AppStyles.textStyle24BoldBlack.copyWith(
              color: AppColors.onPrimaryDark,
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: AppColors.primaryDark,
            radius: 25,
            child: Icon(
             isEven ?  Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: AppColors.onPrimaryDark,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
