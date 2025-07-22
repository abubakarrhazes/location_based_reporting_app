import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';

class ReportCard extends StatelessWidget {
  final String reportType;
  final String location;
  final String timeAgo;
  final String status;
  final Color statusColor;
  final VoidCallback? onTap;

  const ReportCard({
    Key? key,
    required this.reportType,
    required this.location,
    required this.timeAgo,
    required this.status,
    this.statusColor = Colors.orange,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reportType,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'TripSans-Regular',
                      
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'TripSans-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  timeAgo,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'TripSans-Regular',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'TripSans-Regular',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
