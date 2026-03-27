import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: screenWidth > 900 ? 60 : 24,
      ),
      color: const Color(0xFFF5F5F5),
      child: screenWidth > 700
          ? _desktopFooter()           // Desktop & Tablet
          : _mobileFooter(),           // Mobile
    );
  }

  // Desktop & Large Tablet Layout
  Widget _desktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left: Branding
        Row(
          children: const [
            Icon(Icons.favorite, color: Color(0xFF2C6975), size: 28),
            SizedBox(width: 10),
            Text(
              'Simba',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C6975),
              ),
            ),
            Text(
              '+',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF68B2AD),
              ),
            ),
          ],
        ),

        // Center: Navigation Links
        Row(
          children: [
            _footerLink('Features'),
            const SizedBox(width: 32),
            _footerLink('How It Works'),
            const SizedBox(width: 32),
            _footerLink('Pricing'),
            const SizedBox(width: 32),
            _footerLink('Contact'),
          ],
        ),

        // Right: Copyright
        Text(
          '© 2026 Simba+. All rights reserved.',
          style: const TextStyle(
            color: Color(0xFF2C6975),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Mobile Layout (Stacked)
  Widget _mobileFooter() {
    return Column(
      children: [
        // Branding
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.favorite, color: Color(0xFF2C6975), size: 28),
            SizedBox(width: 10),
            Text(
              'Simba',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C6975),
              ),
            ),
            Text(
              '+',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF68B2AD),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Navigation Links - Centered
        Wrap(
          spacing: 20,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _footerLink('Features'),
            _footerLink('How It Works'),
            _footerLink('Pricing'),
            _footerLink('Contact'),
          ],
        ),

        const SizedBox(height: 30),

        // Copyright
        Text(
          '© 2026 Simba+. All rights reserved.',
          style: const TextStyle(
            color: Color(0xFF2C6975),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _footerLink(String title) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation later
        print('$title clicked');
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF2C6975),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}