import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/widgets/brand_logo_widget.dart';
import 'package:location_based_reporting_app/core/widgets/custom_text_button.dart';

class LoginConfirmDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BrandLogoWidget(size: 30),
            SizedBox(height: 20),
            Text(
              'Check your inbox!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'TripSans-Bold',
              ),
            ),
            SizedBox(height: 15),
            Text(
              'We\'ve sent you an email with a login link.\nFind the email and click the login link to\ncontinue.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.4,
                fontFamily: 'TripSans-Regular',
              ),
            ),
            SizedBox(height: 25),
            CustomTextButton(
              text: 'Try again',
              underline: true,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
