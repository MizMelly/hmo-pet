import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: const Color.fromARGB(255, 232, 241, 240),
      child: Column(
        children: [
          // "CORE FEATURES" label
          Text(
            'CORE FEATURES',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Color(0xFF68B2AD),
            ),
          ),
          const SizedBox(height: 16),
          
          // Main heading
          const Text(
            'Everything your pet needs',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 20),
          
          // Subtitle
          const SizedBox(
            width: 700,
            child: Text(
              'Simba+ brings together pet profiles, vet consultations, and health insurance into one seamless platform.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF5A7C86),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 80),
          
          // Feature cards row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _featureCard(
                icon: Icons.assignment,
                title: 'Pet Profile & Records',
                description:
                    'Track your pet\'s name, breed, age, weight, vaccination records, and health notes — all in one place.',
              ),
              _featureCard(
                icon: Icons.chat_bubble_outline,
                title: 'Instant Vet Access',
                description:
                    'Chat with or book a consultation with verified veterinarians whenever your pet needs care.',
              ),
              _featureCard(
                icon: Icons.shield_outlined,
                title: 'Pet HMO Plans',
                description:
                    'Affordable monthly subscription plans (Basic & Premium) so your pet always has healthcare coverage.',
              ),
            ],
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
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F3F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
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
            const SizedBox(height: 12),
            
            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF5A7C86),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
