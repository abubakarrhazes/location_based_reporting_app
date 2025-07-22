import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color textColor;
  final bool showLogo;

  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.showBackButton = false,
    this.backgroundColor = AppColors.textPrimary,

    this.textColor = Colors.white,
    this.showLogo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: textColor),
              onPressed: () => Navigator.pop(context),
            )
          : leading,
      title: Row(
        children: [
          if (showLogo) ...[
            Image.asset(AppAssets.logo, height: 32, width: 32),
            SizedBox(width: 8),
          ],
          Text(title!, style: TextStyle(color: textColor)),
        ],
      ),
      actions: actions,
      centerTitle: true,
      backgroundColor: AppColors.textPrimary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
