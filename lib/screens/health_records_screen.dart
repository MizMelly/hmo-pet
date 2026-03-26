import 'package:flutter/material.dart';

class HealthRecordsScreen extends StatelessWidget {
  const HealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text(
          'Health Records',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,                    // Pushed title to the middle
        backgroundColor: const Color(0xFF2C6975),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,     // Removed back arrow
      ),
      body: Column(
        children: [
          // Tab Bar: Favourites | All
          Container(
            color: Colors.white,
            child: const TabBarSection(),
          ),

          // Grid of Health Record Categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.05,
                children: const [
                  _HealthCard(
                    icon: Icons.favorite,
                    color: Colors.red,
                    title: 'Clinical Vitals',
                  ),
                  _HealthCard(
                    icon: Icons.medication,
                    color: Colors.orange,
                    title: 'Medications',
                  ),
                  _HealthCard(
                    icon: Icons.psychology,
                    color: Colors.purple,
                    title: 'Symptoms',
                  ),
                  _HealthCard(
                    icon: Icons.face,
                    color: Colors.blue,
                    title: 'Mood',
                  ),
                  _HealthCard(
                    icon: Icons.biotech,
                    color: Colors.teal,
                    title: 'Lab Results',
                  ),
                  _HealthCard(
                    icon: Icons.assignment,
                    color: Colors.green,
                    title: 'Questionnaires',
                  ),
                  _HealthCard(
                    icon: Icons.local_florist,
                    color: Colors.amber,
                    title: 'Allergies',
                  ),
                  _HealthCard(
                    icon: Icons.description,
                    color: Colors.indigo,
                    title: 'Files',
                  ),
                  _HealthCard(
                    icon: Icons.medical_information,
                    color: Colors.deepOrange,
                    title: 'Conditions',
                  ),
                  _HealthCard(
                    icon: Icons.shield,
                    color: Colors.cyan,
                    title: 'Immunizations',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Tab Bar (Favourites & All)
class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFF2C6975).withOpacity(0.2)),
              ),
              child: const Center(
                child: Text(
                  'Favourites',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF2C6975),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'All',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Health Record Card Widget
class _HealthCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  const _HealthCard({
    required this.icon,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 36,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}