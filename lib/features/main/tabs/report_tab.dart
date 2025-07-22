import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/core/widgets/custom_app_bar.dart';
import 'package:location_based_reporting_app/core/widgets/report_card.dart';

class ReportListTab extends StatelessWidget {
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 5,
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1 - 10 of 121',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Load more',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'No reports available',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Add report',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
