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
          // Scrollable content with top padding for sticky navbar
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70), 
                HeroSection(),
                FeaturesSection(),
                HowItWorksSection(),
                PricingSection(),
                Footer(),
              ],
            ),
          ),
          // Fixed navbar at top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Navbar(
                onLoginPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                onGetStartedPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}