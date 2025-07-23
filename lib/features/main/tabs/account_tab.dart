import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/features/profile/view/user_profile_edit_screen.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Profile & settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontFamily: 'TripSans-Regular',
                ),
              ),
            ),
            const SizedBox(height: 50),

            const AvatarDisplay(),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: [
                  Text(
                    '(Name)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '(Email address)',
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Role',
                    style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '(Role)',
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    'Edit?',
                    Colors.grey[300]!,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfileEditScreen(),
                      ),
                    ),
                  ),
                  _buildActionButton('Logout?', Colors.grey[300]!, () {}),
                ],
              ),
            ),

            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  Divider(color: Colors.grey),
                  _buildMenuItem(Icons.help_outline, 'Help & support', () {}),
                  const SizedBox(height: 20),
                  Divider(color: Colors.grey),

                  _buildMenuItem(
                    Icons.description_outlined,
                    'Terms & conditions',
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
          fontFamily: 'TripSans-Bold',
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF666666), size: 24),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Color(0xFF999999), size: 20),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

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
