import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/core/const/app_sizes.dart';
import 'package:location_based_reporting_app/core/widgets/custom_app_bar.dart';
import 'package:location_based_reporting_app/core/widgets/custom_primary_button.dart';
import 'package:location_based_reporting_app/core/widgets/custom_text_button.dart';
import 'package:location_based_reporting_app/core/widgets/report_card.dart';
import 'package:location_based_reporting_app/features/report/views/add_report_dialog.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      appBar: CustomAppBar(
        title: 'Dashboard',

        textColor: AppColors.background,
        showLogo: true,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Admin',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'TripSans-Regular',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: AppSize.safeBlockVertical! * 4,
          left: AppSize.safeBlockHorizontal! * 7,
          right: AppSize.safeBlockHorizontal! * 7,
          bottom: AppSize.safeBlockHorizontal! * 7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  child: Image.asset(
                    AppAssets.backgroundMap,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   bottom: 16,
                //   right: 16,
                //   child: CustomIconButton(
                //     icon: Icons.add,
                //     size: 24,
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'My recent reports',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'TripSans-Bold',
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ReportCard(
                    reportType: '[Report type]',
                    location: 'Location',
                    timeAgo: '(2 Min)',
                    status: '[Status Not Set]',
                    statusColor: Colors.orange,
                    onTap: () {
                      // Handle report tap
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1 - 10 of 121',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  CustomTextButton(text: 'View all', onPressed: () {}),
                ],
              ),
            ),
            Text(
              'No reports available',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            SizedBox(height: 20),
            CustomPrimaryButton(
              text: 'Add report',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddReportDialog(),
                );
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
