import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Welcome Joy',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E8E7)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Color(0xFF2C6975)),
                  suffixIcon: Icon(Icons.tune, color: Color(0xFF2C6975)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Overview Section
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ServiceCard(
                  icon: Icons.medical_services,
                  label: 'Veterinary',
                  color: const Color(0xFF2C6975),
                ),
                _ServiceCard(
                  icon: Icons.cut,
                  label: 'Grooming',
                  color: const Color(0xFF2C6975),
                ),
                _ServiceCard(
                  icon: Icons.home,
                  label: 'Boarding',
                  color: const Color(0xFF2C6975),
                ),
                _ServiceCard(
                  icon: Icons.monetization_on_outlined,
                  label: 'Training',
                  color: const Color(0xFF2C6975),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Upcoming Appointment Section
            const Text(
              'Upcoming Appointment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

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
}

// Service Card Widget (Overview)
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
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F0EE),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 32, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// Appointment Card Widget (Upcoming Appointment)
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E8E7)),
      ),
      child: Row(
        children: [
          // Date Container
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F0EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  date.split(' ')[0], // e.g., "Apr"
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C6975),
                  ),
                ),
                Text(
                  date.split(' ')[1], // e.g., "2"
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C6975),
                  ),
                ),
                Text(
                  date.split(' ')[2], // e.g., "2026"
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  service,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF2C6975), size: 28),
        ],
      ),
    );
  }
}