import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/core/const/app_sizes.dart';
import 'package:location_based_reporting_app/core/routes/routes_entry.dart';
import 'package:location_based_reporting_app/core/widgets/brand_logo_widget.dart';
import 'package:location_based_reporting_app/core/widgets/custom_primary_button.dart';
import 'package:location_based_reporting_app/core/widgets/custom_text_button.dart';
import 'package:location_based_reporting_app/features/auth/views/login_screen.dart';
import 'package:location_based_reporting_app/features/auth/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A1A), Color(0xFF2D1B69), Color(0xFF1A1A1A)],
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.gridPattern),
                  fit: BoxFit.cover,

                  opacity: 0.1,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BrandLogoWidget(),
                  SizedBox(height: 30),
                  Text(
                    'Fixaroo',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontFamily: 'TripSans-Bold',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tag the issue, get it fixed!',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.5,
                      fontFamily: 'TripSans-Regular',
                    ),
                  ),
                  SizedBox(height: 60),
                  // Buttons
                  Column(
                    children: [
                      CustomPrimaryButton(
                        text: 'Log in or sign up',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesEntry.loginAccount,
                          );
                        },
                        width: 200,
                      ),
                      SizedBox(height: 15),
                      CustomPrimaryButton(
                        text: 'Complete signup',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesEntry.createAccount,
                          );
                        },
                        width: 200,
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                            bgColor: AppColors.primary,
                            text: 'Login',

                            textColor: Colors.white,
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutesEntry.dashBoardScreen,
                              (route) => false,
                            ),
                          ),
                          SizedBox(width: 20),
                          CustomTextButton(
                            bgColor: AppColors.textPrimary,
                            text: 'Admin',
                            textColor: AppColors.primary,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Footer
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  '© 2024 Bruno Duarte Ltd.  Terms  Track & Support',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontFamily: 'TripSans-Regular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
