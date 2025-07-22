import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/features/main/tabs/account_tab.dart';
import 'package:location_based_reporting_app/features/main/tabs/dash_board_tab.dart';
import 'package:location_based_reporting_app/features/main/tabs/report_map_tab.dart';
import 'package:location_based_reporting_app/features/main/tabs/report_tab.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardTab(),
    ReportListTab(),
    ReportMapTab(),
    AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A1A1A),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF1A1A1A),
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.dashboardIcon, width: 24, height: 24),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.reportListIcon,
                width: 24,
                height: 24,
              ),
              label: 'Report List',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.reportMapIcon, width: 24, height: 24),
              label: 'Report Map',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.accountIcon, width: 24, height: 24),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
