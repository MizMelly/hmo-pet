import 'package:flutter/material.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isTablet = screenWidth > 600 && screenWidth <= 900;

    // Pre-calculate responsive values
    final verticalPadding = isDesktop ? 100.0 : 70.0;
    final horizontalPadding = isDesktop ? 60.0 : 24.0;
    final headingFontSize = isDesktop ? 44.0 : (isTablet ? 36.0 : 28.0);
    final subtitleFontSize = isDesktop ? 16.0 : 15.0;
    final spacingAfterSubtitle = isDesktop ? 80.0 : 50.0;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      color: const Color.fromARGB(255, 232, 241, 240),
      child: Column(
        children: [
          // Label
          Text(
            'PRICING',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: const Color(0xFF68B2AD),
            ),
          ),
          const SizedBox(height: 16),

          // Main Heading
          Text(
            'Affordable pet HMO plans',
            style: TextStyle(
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C6975),
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Subtitle
          Text(
            'Choose a plan that fits your budget. Cancel anytime.',
            style: TextStyle(
              fontSize: subtitleFontSize,
              color: const Color(0xFF5A7C86),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacingAfterSubtitle),   // ← Fixed: Removed 'const'

          // Pricing Cards
          isDesktop
              ? _buildDesktopLayout()
              : _buildMobileLayout(isTablet),
        ],
      ),
    );
  }

  // Desktop Layout (Side by side)
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildBasicPlan()),
        const SizedBox(width: 32),
        Expanded(child: _buildPremiumPlan(isPopular: true)),
      ],
    );
  }

  // Mobile & Tablet Layout (Stacked)
  Widget _buildMobileLayout(bool isTablet) {
    return Column(
      children: [
        _buildBasicPlan(),
        const SizedBox(height: 32),
        _buildPremiumPlan(isPopular: true),
      ],
    );
  }

  // Basic Plan Card
  Widget _buildBasicPlan() {
    return _pricingCard(
      title: 'Basic',
      subtitle: 'Essential pet healthcare coverage',
      price: '2,500',
      features: [
        'Pet profile management',
        'Health record tracking',
        '1 vet chat per month',
        'Vaccination reminders',
        'Email support',
      ],
      buttonColor: const Color(0xFF2C6975),
      buttonTextColor: Colors.white,
      isPopular: false,
    );
  }

  // Premium Plan Card
  Widget _buildPremiumPlan({required bool isPopular}) {
    return _pricingCard(
      title: 'Premium',
      subtitle: 'Complete care for your furry family',
      price: '5,000',
      features: [
        'Everything in Basic',
        'Unlimited vet chats',
        'Priority vet booking',
        'Health analytics dashboard',
        '24/7 emergency support',
        'Family plan (up to 3 pets)',
      ],
      buttonColor: const Color(0xFF68B2AD),
      buttonTextColor: const Color(0xFF2C6975),
      isPopular: isPopular,
    );
  }

  // Reusable Pricing Card
  Widget _pricingCard({
    required String title,
    required String subtitle,
    required String price,
    required List<String> features,
    required Color buttonColor,
    required Color buttonTextColor,
    required bool isPopular,
  }) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isPopular ? const Color(0xFF2C6975) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF68B2AD).withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Most Popular',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

          const SizedBox(height: 20),

          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isPopular ? Colors.white : const Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: isPopular ? const Color(0xFF68B2AD) : const Color(0xFF5A7C86),
            ),
          ),

          const SizedBox(height: 32),

          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '₦$price',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: isPopular ? Colors.white : const Color(0xFF2C6975),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '/month',
                style: TextStyle(
                  fontSize: 16,
                  color: isPopular ? const Color(0xFF68B2AD) : const Color(0xFF5A7C86),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Features
          ...features.map((feature) => _featureItem(feature, isPopular)),

          const SizedBox(height: 40),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: isPopular ? 4 : 0,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItem(String text, bool isPopular) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 22,
            color: isPopular ? Colors.white : const Color(0xFF2C6975),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: isPopular ? Colors.white : const Color(0xFF2C6975),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}