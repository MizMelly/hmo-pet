import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onGetStartedPressed;

  const Navbar({
    super.key,
    required this.onLoginPressed,
    required this.onGetStartedPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 900;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Branding
              const Row(
                children: [
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

              // Navigation Links (Desktop only)
              if (!isSmall)
                Row(
                  children: [
                    _navLink(context, 'Features', 800),
                    const SizedBox(width: 32),
                    _navLink(context, 'How It Works', 1600),
                    const SizedBox(width: 32),
                    _navLink(context, 'Pricing', 2400),
                  ],
                ),

              // Right side - Login & Get Started
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
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: onGetStartedPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C6975),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
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

  Widget _navLink(BuildContext context, String title, double scrollOffset) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: () => _scrollToSection(context, scrollOffset),
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

  void _scrollToSection(BuildContext context, double offset) {
    // Removed unnecessary null check - PrimaryScrollController.of(context) is never null here
    PrimaryScrollController.of(context).animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}