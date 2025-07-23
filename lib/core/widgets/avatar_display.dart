import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';

class AvatarDisplay extends StatelessWidget {
  const AvatarDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(AppAssets.backgroundAvaatr),
        ],
      ),
    );
  }
}
