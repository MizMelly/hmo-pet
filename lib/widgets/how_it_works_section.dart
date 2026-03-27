import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;
    final isTablet = screenWidth > 700 && screenWidth <= 1100;

    // Pre-calculate responsive values
    final verticalPadding = isDesktop ? 100.0 : 70.0;
    final horizontalPadding = isDesktop ? 60.0 : 24.0;
    final headingFontSize = isDesktop ? 44.0 : (isTablet ? 36.0 : 28.0);
    final spacingAfterHeading = isDesktop ? 90.0 : 60.0;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          // Label
          Text(
            'HOW IT WORKS',
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
            'Simple as 1-2-3-4',
            style: TextStyle(
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C6975),
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacingAfterHeading),   // ← Fixed: Removed 'const'

          // Steps
          if (isDesktop)
            _buildDesktopLayout()
          else if (isTablet)
            _buildTabletLayout()
          else
            _buildMobileLayout(),
        ],
      ),
    );
  }

  // Desktop: 4 steps in one row with connecting lines
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStep(1, Icons.person_add_outlined, 'Create Pet Profile',
            'Add your pet\'s details and health history', false),
        _buildStep(2, Icons.show_chart_outlined, 'Track Health',
            'Log vaccinations, notes, and vet visits', false),
        _buildStep(3, Icons.local_hospital, 'Chat / Book a Vet',
            'Get instant access to verified vets', false),
        _buildStep(4, Icons.card_membership_outlined, 'Subscribe to HMO',
            'Choose an affordable monthly plan', true),
      ],
    );
  }

  // Tablet: 2 columns
  Widget _buildTabletLayout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildStep(1, Icons.person_add_outlined, 'Create Pet Profile',
                  'Add your pet\'s details and health history', false),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: _buildStep(2, Icons.show_chart_outlined, 'Track Health',
                  'Log vaccinations, notes, and vet visits', false),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildStep(3, Icons.local_hospital, 'Chat / Book a Vet',
                  'Get instant access to verified vets', false),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: _buildStep(4, Icons.card_membership_outlined, 'Subscribe to HMO',
                  'Choose an affordable monthly plan', true),
            ),
          ],
        ),
      ],
    );
  }

  // Mobile: Vertical stack
  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildStep(1, Icons.person_add_outlined, 'Create Pet Profile',
            'Add your pet\'s details and health history', false),
        const SizedBox(height: 50),
        _buildStep(2, Icons.show_chart_outlined, 'Track Health',
            'Log vaccinations, notes, and vet visits', false),
        const SizedBox(height: 50),
        _buildStep(3, Icons.local_hospital, 'Chat / Book a Vet',
            'Get instant access to verified vets', false),
        const SizedBox(height: 50),
        _buildStep(4, Icons.card_membership_outlined, 'Subscribe to HMO',
            'Choose an affordable monthly plan', true),
      ],
    );
  }

  Widget _buildStep(
    int stepNumber,
    IconData icon,
    String title,
    String description,
    bool isLast,
  ) {
    return Expanded(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // Connecting Line (only on desktop)
              if (!isLast)
                Positioned(
                  top: 45,
                  left: 80,
                  right: -40,
                  child: Container(
                    height: 3,
                    color: const Color(0xFFD0D8DD),
                  ),
                ),

              // Icon Circle
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F3F1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 42,
                    color: const Color(0xFF2C6975),
                  ),
                ),
              ),

              // Step Number Badge
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C6975),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      stepNumber.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 12),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF5A7C86),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}