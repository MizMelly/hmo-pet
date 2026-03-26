import 'package:flutter/material.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text(
          'More Options',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2C6975),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: const Icon(Icons.home_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: const Color(0xFFE6F0EE),
                          child: const CircleAvatar(
                            radius: 52,
                            backgroundImage: NetworkImage('https://via.placeholder.com/200'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Color(0xFF2C6975),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('Shokaris', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text('Ref_123456', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(child: _InfoBox(title: 'Age', value: '56 years')),
                        const SizedBox(width: 12),
                        Expanded(child: _InfoBox(title: 'Email', value: 'hannahj@email.com')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _InfoBox(title: 'Phone Number', value: '+ 971 4234 4112'),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(child: _SmallInfoBox(title: 'ID', value: '311097152')),
                        const SizedBox(width: 12),
                        Expanded(child: _SmallInfoBox(title: 'Policy', value: 'CAS17128')),
                        const SizedBox(width: 12),
                        Expanded(child: _SmallInfoBox(title: 'Residence', value: 'California')),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _OptionCard(
                    title: 'Diary',
                    value: '15',
                    subtitle: 'Total',
                    icon: Icons.book_outlined,
                    color: const Color(0xFF2C6975),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _OptionCard(
                    title: 'Settings',
                    value: '12',
                    subtitle: 'Action',
                    icon: Icons.settings_outlined,
                    color: const Color(0xFF2C6975),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widgets (same as before)
class _InfoBox extends StatelessWidget {
  final String title;
  final String value;
  const _InfoBox({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        ],
      ),
    );
  }
}

class _SmallInfoBox extends StatelessWidget {
  final String title;
  final String value;
  const _SmallInfoBox({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _OptionCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 28, color: color),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 20),
          Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}