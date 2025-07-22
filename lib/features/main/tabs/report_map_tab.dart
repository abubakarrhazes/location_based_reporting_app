import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/core/widgets/custom_app_bar.dart';

class ReportMapTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      appBar: CustomAppBar(
        title: 'My reports',
        textColor: AppColors.background,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.background),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: Center(
              child: Image.asset(
                AppAssets.backgroundMap,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          ],
      ),
    );
  }
}
