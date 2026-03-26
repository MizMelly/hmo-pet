import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      color: const Color(0xFFF5F5F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Branding
          Row(
            children: const [
              Icon(Icons.favorite, color: Color(0xFF2C6975), size: 24),
              SizedBox(width: 8),
              Text(
                'Simba',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C6975),
                ),
              ),
              Text(
                '+',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF68B2AD),
                ),
              ),
            ],
          ),

          // Center: Navigation links
          Row(
            children: [
              _footerLink('Features'),
              const SizedBox(width: 24),
              _footerLink('How It Works'),
              const SizedBox(width: 24),
              _footerLink('Pricing'),
            ],
          ),

          // Right: Copyright
          const Text(
            '© 2026 Simba+. All rights reserved.',
            style: TextStyle(
              color: Color(0xFF2C6975),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF2C6975),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
