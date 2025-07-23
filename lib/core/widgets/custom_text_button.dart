import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double fontSize;
  final bool underline;
  final FontWeight fontWeight;
  final Color? bgColor;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize = 16,
    this.underline = false,
    this.bgColor,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 40,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,

          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? AppColors.primary,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: underline ? TextDecoration.underline : null,
            fontFamily: 'TripSans-Regular',
          ),
        ),
      ),
    );
  }
}
