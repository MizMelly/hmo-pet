import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          // "HOW IT WORKS" label
          Text(
            'HOW IT WORKS',
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
            'Simple as 1-2-3-4',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C6975),
            ),
          ),
          const SizedBox(height: 80),
          
          // Steps row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildStep(
                  stepNumber: 1,
                  icon: Icons.person_add_outlined,
                  title: 'Create Pet Profile',
                  description: 'Add your pet\'s details and health history',
                  isLast: false,
                ),
              ),
              Expanded(
                child: _buildStep(
                  stepNumber: 2,
                  icon: Icons.show_chart_outlined,
                  title: 'Track Health',
                  description: 'Log vaccinations, notes, and vet visits',
                  isLast: false,
                ),
              ),
              Expanded(
                child: _buildStep(
                  stepNumber: 3,
                  icon: Icons.local_hospital,
                  title: 'Chat / Book a Vet',
                  description: 'Get instant access to verified vets',
                  isLast: false,
                ),
              ),
              Expanded(
                child: _buildStep(
                  stepNumber: 4,
                  icon: Icons.card_membership_outlined,
                  title: 'Subscribe to HMO',
                  description: 'Choose an affordable monthly plan',
                  isLast: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required int stepNumber,
    required IconData icon,
    required String title,
    required String description,
    required bool isLast,
  }) {
    return Column(
      children: [
        // Icon with step badge and connecting line
        Stack(
          alignment: Alignment.topCenter,
          children: [
            // Connecting line (between steps)
            if (!isLast)
              Positioned(
                top: 40,
                left: 50,
                right: -50,
                child: Container(
                  height: 2,
                  color: const Color(0xFFD0D8DD),
                ),
              ),
            
            // Icon circle
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F3F1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 40,
                  color: const Color(0xFF2C6975),
                ),
              ),
            ),
            
            // Step number badge
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFF2C6975),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    stepNumber.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C6975),
          ),
        ),
        const SizedBox(height: 8),
        
        // Description
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF5A7C86),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
