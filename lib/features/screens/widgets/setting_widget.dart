import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key, required this.settingData});
  final String settingData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onPrimaryDark),
      ),
      child: Row(
        children: [
          Text(
            settingData,
            style: AppStyles.textStyle20Bold.copyWith(fontWeight: .w500),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down, color: AppColors.onPrimaryDark),
        ],
      ),
    );
  }
}
