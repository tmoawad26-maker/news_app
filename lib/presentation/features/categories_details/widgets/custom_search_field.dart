import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';
class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key, this.onChanged,
  });
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.onPrimaryDark,
      onChanged: onChanged,
      style: AppStyles.textStyle20Bold.copyWith(
        color: AppColors.onPrimaryDark
      ),
      decoration: InputDecoration(
          hintText: AppStrings.search,
          hintStyle: AppStyles.textStyle20Bold,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.onPrimaryDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.onPrimaryDark),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          suffixIcon: Icon(Icons.close)
      ),
    );
  }
}
