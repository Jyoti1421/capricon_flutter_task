import 'package:capricon_flutter_task/constant/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  // New TextStyle
  static const TextStyle welcomeHeadingText = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: AppColors.white,
  );
  static const TextStyle noStockFoundText = TextStyle(
    color: AppColors.white,
    fontSize: 16,
  );
  static const TextStyle errorText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.errorMessageColor,
  );
}
