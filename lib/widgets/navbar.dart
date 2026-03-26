import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onGetStartedPressed;

  const Navbar({super.key, required this.onLoginPressed, required this.onGetStartedPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 800;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Branding
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite, color: Color(0xFF2C6975), size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Simba',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C6975),
                    ),
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF68B2AD),
                    ),
                  ),
                ],
              ),

              // Center links on large screens
              if (!isSmall)
                Row(
                  children: [
                    _navLink('Features'),
                    const SizedBox(width: 24),
                    _navLink('How It Works'),
                    const SizedBox(width: 24),
                    _navLink('Pricing'),
                  ],
                ),

              // Right actions
              Row(
                children: [
                  TextButton(
                    onPressed: onLoginPressed,
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF2C6975),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: onGetStartedPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C6975),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _navLink(String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF2C6975),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
