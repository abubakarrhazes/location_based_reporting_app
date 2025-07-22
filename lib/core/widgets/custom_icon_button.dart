import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.size = 30,
    this.backgroundColor,
    this.iconColor = Colors.white,
    this.onPressed,
    this.width,
    this.height,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? size * 2,
        height: height ?? size * 2,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: boxShadow,
        ),
        child: Icon(icon, size: size, color: iconColor),
      ),
    );
  }
}
