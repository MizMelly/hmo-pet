import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    // Pre-calculate responsive values
    final verticalPadding = isDesktop ? 100.0 : 60.0;
    final horizontalPadding = isDesktop ? 40.0 : 20.0;
    final headingFontSize = isDesktop
        ? 44.0
        : (screenWidth > 600 ? 36.0 : 28.0);
    final subtitleWidth = isDesktop ? 700.0 : double.infinity;
    final subtitleFontSize = screenWidth > 600 ? 16.0 : 15.0;
    final spacingAfterSubtitle = isDesktop ? 80.0 : 50.0;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      color: const Color.fromARGB(255, 232, 241, 240),
      child: Column(
        children: [
          // CORE FEATURES Label
          Text(
            'CORE FEATURES',
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
            'Everything your pet needs',
            style: TextStyle(
              fontSize: headingFontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C6975),
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Subtitle
          SizedBox(
            width: subtitleWidth,
            child: Text(
              'Simba+ brings together pet profiles, vet consultations, and health insurance into one seamless platform.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subtitleFontSize,
                color: const Color(0xFF5A7C86),
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: spacingAfterSubtitle),   // ← Fixed: Removed 'const'

          // Feature Cards - Responsive Layout
          LayoutBuilder(
            builder: (context, constraints) {
              if (isDesktop) {
                // Desktop: 3 cards in a row
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _featureCard(
                      icon: Icons.assignment,
                      title: 'Pet Profile & Records',
                      description:
                          'Track your pet\'s name, breed, age, weight, vaccination records, and health notes — all in one place.',
                    ),
                    const SizedBox(width: 24),
                    _featureCard(
                      icon: Icons.chat_bubble_outline,
                      title: 'Instant Vet Access',
                      description:
                          'Chat with or book a consultation with verified veterinarians whenever your pet needs care.',
                    ),
                    const SizedBox(width: 24),
                    _featureCard(
                      icon: Icons.shield_outlined,
                      title: 'Pet HMO Plans',
                      description:
                          'Affordable monthly subscription plans (Basic & Premium) so your pet always has healthcare coverage.',
                    ),
                  ],
                );
              } else if (screenWidth > 600) {
                // Tablet: 2 cards in a row
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _featureCard(
                        icon: Icons.assignment,
                        title: 'Pet Profile & Records',
                        description:
                            'Track your pet\'s name, breed, age, weight, vaccination records, and health notes — all in one place.',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _featureCard(
                        icon: Icons.chat_bubble_outline,
                        title: 'Instant Vet Access',
                        description:
                            'Chat with or book a consultation with verified veterinarians whenever your pet needs care.',
                      ),
                    ),
                  ],
                );
              } else {
                // Mobile: Cards stacked vertically
                return Column(
                  children: [
                    _featureCard(
                      icon: Icons.assignment,
                      title: 'Pet Profile & Records',
                      description:
                          'Track your pet\'s name, breed, age, weight, vaccination records, and health notes — all in one place.',
                    ),
                    const SizedBox(height: 20),
                    _featureCard(
                      icon: Icons.chat_bubble_outline,
                      title: 'Instant Vet Access',
                      description:
                          'Chat with or book a consultation with verified veterinarians whenever your pet needs care.',
                    ),
                    const SizedBox(height: 20),
                    _featureCard(
                      icon: Icons.shield_outlined,
                      title: 'Pet HMO Plans',
                      description:
                          'Affordable monthly subscription plans (Basic & Premium) so your pet always has healthcare coverage.',
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F3F1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              size: 34,
              color: const Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 14),

          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF5A7C86),
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}