import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String number;
  final String label;
  const StatItem({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(number, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Color(0xFF2C6975))),
      Text(label, style: const TextStyle(fontSize: 15, color: Color(0xFF2C6975))),
    ]);
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const FeatureCard({super.key, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 380,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 25, offset: Offset(0, 12))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 62, height: 62, decoration: BoxDecoration(color: const Color(0xFFCDE0C9), borderRadius: BorderRadius.circular(16)), child: Icon(icon, size: 32, color: const Color(0xFF2C6975))),
            const SizedBox(height: 28),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2C6975), height: 1.2)),
            const SizedBox(height: 16),
            Expanded(child: Text(description, style: const TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF2C6975)))),
          ],
        ),
      ),
    );
  }
}