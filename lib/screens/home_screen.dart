import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/how_it_works_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80),
                HeroSection(),
                FeaturesSection(),
                HowItWorksSection(),
                PricingSection(),
                Footer(),
              ],
            ),
          ),

          // Sticky Navbar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _StickyNavbar(),
          ),
        ],
      ),
    );
  }
}

// Extracted widget for navbar (clean and const-friendly)
class _StickyNavbar extends StatelessWidget {
  const _StickyNavbar({super.key});   // Proper constructor with key

  @override
  Widget build(BuildContext context) {
    return Navbar(
      onLoginPressed: () => _navigateToLogin(context),
      onGetStartedPressed: () => _navigateToRegister(context),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }
}