import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location_based_reporting_app/core/routes/app_routes.dart';
import 'package:location_based_reporting_app/core/routes/routes_entry.dart';
import 'package:location_based_reporting_app/features/report/views/edit_report_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesEntry.initialRoute,
        onGenerateRoute: AppRoutes.onGenerate,
      ),
    );
  }
}
