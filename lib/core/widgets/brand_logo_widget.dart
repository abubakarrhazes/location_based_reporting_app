import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';

class BrandLogoWidget extends StatelessWidget {
  final double size;
  final bool showShadow;

  const BrandLogoWidget({Key? key, this.size = 60, this.showShadow = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5
          ),
        ],
      ),
      child: Center(child: Image.asset(AppAssets.logo, width: 80, height: 80)),
    );
  }
}
