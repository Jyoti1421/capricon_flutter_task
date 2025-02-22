import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../constant/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool centerTitle;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor = AppColors.black,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: AppColors.white, // Set the icon color here
      ),
      title: Text(title, style: TextStyles.appBarTitle),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
}
