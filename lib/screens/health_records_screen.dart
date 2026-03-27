import 'package:flutter/material.dart';

class HealthRecordsScreen extends StatelessWidget {
  const HealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

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
        centerTitle: true,
        backgroundColor: const Color(0xFF2C6975),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Tab Bar (Favourites | All)
          const TabBarSection(),

          // Responsive Grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 2 : 3,     // 2 on mobile, 3 on tablet
                  mainAxisSpacing: isSmallScreen ? 12 : 16,
                  crossAxisSpacing: isSmallScreen ? 12 : 16,
                  childAspectRatio: isSmallScreen ? 0.95 : 1.05,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final items = [
                    {'icon': Icons.favorite, 'color': Colors.red, 'title': 'Clinical Vitals'},
                    {'icon': Icons.medication, 'color': Colors.orange, 'title': 'Medications'},
                    {'icon': Icons.psychology, 'color': Colors.purple, 'title': 'Symptoms'},
                    {'icon': Icons.face, 'color': Colors.blue, 'title': 'Mood'},
                    {'icon': Icons.biotech, 'color': Colors.teal, 'title': 'Lab Results'},
                    {'icon': Icons.assignment, 'color': Colors.green, 'title': 'Questionnaires'},
                    {'icon': Icons.local_florist, 'color': Colors.amber, 'title': 'Allergies'},
                    {'icon': Icons.description, 'color': Colors.indigo, 'title': 'Files'},
                    {'icon': Icons.medical_information, 'color': Colors.deepOrange, 'title': 'Conditions'},
                    {'icon': Icons.shield, 'color': Colors.cyan, 'title': 'Immunizations'},
                  ];

                  final item = items[index];

                  return _HealthCard(
                    icon: item['icon'] as IconData,
                    color: item['color'] as Color,
                    title: item['title'] as String,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== Tab Bar Section ====================
class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              title: 'Favourites',
              isActive: false,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _TabButton(
              title: 'All',
              isActive: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String title;
  final bool isActive;

  const _TabButton({required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2C6975) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: isActive 
            ? null 
            : Border.all(color: const Color(0xFF2C6975).withOpacity(0.2)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : Colors.black87,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

// ==================== Health Record Card ====================
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
              size: 38,
              color: color,
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}