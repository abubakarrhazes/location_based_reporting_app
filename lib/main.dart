import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location_based_reporting_app/features/auth/views/splash_screen.dart';

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
        // theme: LightTheme.theme, // Use LightTheme here
        // darkTheme: DarkTheme.theme, // Use DarkTheme here
        // themeMode: themeProvider.themeMode, // Set theme mode dynamically
        home: SplashScreen(),
      ),
    );
  }
}
