import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Welcome Joy',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: isSmallScreen ? 18 : 22,
          ),
        ),
        leading: const Icon(Icons.pets, color: Color(0xFF2C6975), size: 28),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            _buildSearchBar(isSmallScreen),

            const SizedBox(height: 24),

            // Overview Section
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Responsive Service Cards Grid
            _buildServiceGrid(isSmallScreen),

            const SizedBox(height: 32),

            // Upcoming Appointments
            const Text(
              'Upcoming Appointments',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            _AppointmentCard(
              date: 'Apr 2 2026',
              pet: 'Fluffy',
              service: 'Vaccination',
            ),
            const SizedBox(height: 12),
            _AppointmentCard(
              date: 'Apr 8 2026',
              pet: 'Milo',
              service: 'Checkup',
            ),
            const SizedBox(height: 12),
            _AppointmentCard(
              date: 'Apr 15 2026',
              pet: 'Luna',
              service: 'Dental Cleaning',
            ),
          ],
        ),
      ),
    );
  }

  // Responsive Search Bar
  Widget _buildSearchBar(bool isSmallScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E8E7)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search services or pets...',
          prefixIcon: const Icon(Icons.search, color: Color(0xFF2C6975)),
          suffixIcon: const Icon(Icons.tune, color: Color(0xFF2C6975)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 12 : 14,
          ),
        ),
      ),
    );
  }

  // Responsive Service Cards using GridView
  Widget _buildServiceGrid(bool isSmallScreen) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isSmallScreen ? 2 : 4,        // 2 on mobile, 4 on larger screens
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: isSmallScreen ? 1.1 : 1.0,  // Better height balance
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final services = [
          {'icon': Icons.medical_services, 'label': 'Veterinary'},
          {'icon': Icons.cut, 'label': 'Grooming'},
          {'icon': Icons.home, 'label': 'Boarding'},
          {'icon': Icons.monetization_on_outlined, 'label': 'Training'},
        ];

        final service = services[index];

        return _ServiceCard(
          icon: service['icon'] as IconData,
          label: service['label'] as String,
          color: const Color(0xFF2C6975),
        );
      },
    );
  }
}

// ==================== Reusable Widgets ====================

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ServiceCard({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F0EE),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 34, color: color),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final String date;
  final String pet;
  final String service;

  const _AppointmentCard({
    required this.date,
    required this.pet,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final dateParts = date.split(' ');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E8E7)),
      ),
      child: Row(
        children: [
          // Date Box
          Container(
            width: 68,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F0EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  dateParts[0],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C6975),
                  ),
                ),
                Text(
                  dateParts[1],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C6975),
                  ),
                ),
                Text(
                  dateParts[2],
                  style: const TextStyle(fontSize: 10, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Pet & Service Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  service,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Color(0xFF2C6975), size: 30),
        ],
      ),
    );
  }
}