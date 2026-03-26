import 'package:flutter/material.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: const Color.fromARGB(255, 232, 241, 240),
      child: Column(
        children: [
          // "PRICING" label
          Text(
            'PRICING',
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
            'Affordable pet HMO plans',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 16),

          // Subtitle
          const Text(
            'Choose a plan that fits your budget. Cancel anytime.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF5A7C86),
            ),
          ),
          const SizedBox(height: 80),

          // Pricing cards
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic plan
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basic',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C6975),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Essential pet healthcare coverage',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF5A7C86),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            '₦2,500',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C6975),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '/month',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF5A7C86),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      _featureItem('Pet profile management'),
                      _featureItem('Health record tracking'),
                      _featureItem('1 vet chat per month'),
                      _featureItem('Vaccination reminders'),
                      _featureItem('Email support'),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2C6975),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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
                ),
              ),
              const SizedBox(width: 32),

              // Premium plan (Most Popular)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C6975),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2C6975).withOpacity(0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Most Popular" badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF68B2AD).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Most Popular',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Premium',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Complete care for your furry family',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF68B2AD),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            '₦5,000',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '/month',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF68B2AD),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      _featureItemWhite('Everything in Basic'),
                      _featureItemWhite('Unlimited vet chats'),
                      _featureItemWhite('Priority vet booking'),
                      _featureItemWhite('Health analytics dashboard'),
                      _featureItemWhite('24/7 emergency support'),
                      _featureItemWhite('Family plan (up to 3 pets)'),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF68B2AD),
                            foregroundColor: const Color(0xFF2C6975),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            size: 20,
            color: Color(0xFF2C6975),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2C6975),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItemWhite(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
