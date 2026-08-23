import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static const TextStyle textStyle12Medium = TextStyle(
    fontSize: 12,
    fontWeight: .w500,
  );
  static const TextStyle textStyle16Bold = TextStyle(
    fontSize: 16,
    fontWeight: .w700,
  );
  static const textStyle20Bold = TextStyle(fontSize: 20,
    fontWeight: .w700);
  static const textStyle24BoldBlack = TextStyle(fontSize: 24, fontWeight: .w700,
    color: AppColors.primaryDark
  );
  static const textStyle24BoldWhite = TextStyle(fontSize: 24, fontWeight: .w700,
      color: AppColors.onPrimaryDark
  );
}
