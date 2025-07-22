// Login Screen
import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/core/const/app_sizes.dart';
import 'package:location_based_reporting_app/core/helpers/login_dialog.dart';
import 'package:location_based_reporting_app/core/widgets/brand_logo_widget.dart';
import 'package:location_based_reporting_app/core/widgets/custom_app_bar.dart';
import 'package:location_based_reporting_app/core/widgets/custom_primary_button.dart';
import 'package:location_based_reporting_app/features/main/dash_board_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      appBar: CustomAppBar(
        title: '',
        textColor: Colors.black87,
        showBackButton: true,
        showLogo: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: AppSize.safeBlockVertical! * 4,
              left: AppSize.safeBlockHorizontal! * 7,
              right: AppSize.safeBlockHorizontal! * 7,
              bottom: AppSize.safeBlockHorizontal! * 7,
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BrandLogoWidget(size: 30),
                SizedBox(height: 20),
                Text(
                  'Enter your email and we\'ll\nsend you a login link.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.4,
                    fontFamily: 'TripSans-Regular',
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomPrimaryButton(
                  text: 'Send login link',
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => LoginConfirmDialog(),
                    // );
                    if (_emailController.text.isNotEmpty) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                        (route) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login link sent to ${_emailController.text}',
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your email')),
                      );
                    }
                  },
                  width: double.infinity,
                ),
                SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Proceeding means you\'re ok with our\n',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontFamily: 'TripSans-Regular',
                    ),
                    children: [
                      TextSpan(
                        text: 'terms & conditions',
                        style: TextStyle(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontFamily: 'TripSans-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
