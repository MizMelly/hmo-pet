import 'package:flutter/material.dart';

class VetAccessScreen extends StatefulWidget {
  const VetAccessScreen({super.key});

  @override
  State<VetAccessScreen> createState() => _VetAccessScreenState();
}

class _VetAccessScreenState extends State<VetAccessScreen> {
  String _searchText = '';

  final List<Map<String, String>> _vets = [
    {'name': 'Dr. Jasmine Green', 'clinic': 'Happy Tails Vet Clinic'},
    {'name': 'Dr. Emilio Park', 'clinic': 'Riverdale Animal Care'},
    {'name': 'Dr. Karen Liu', 'clinic': 'Paws & Claws Medical'},
  ];

  @override
  Widget build(BuildContext context) {
    final matches = _vets.where((vet) {
      return _searchText.isEmpty || vet['name']!.toLowerCase().contains(_searchText.toLowerCase()) || vet['clinic']!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet Access'),
        backgroundColor: const Color(0xFF2C6975),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search veterinarians',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchText = value),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  final vet = matches[index];
                  return ListTile(
                    leading: const Icon(Icons.medical_services, color: Color(0xFF2C6975)),
                    title: Text(vet['name']!),
                    subtitle: Text(vet['clinic']!),
                    trailing: TextButton(
                      child: const Text('Chat'),
                      onPressed: () => _showChatDialog(context, vet['name']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatDialog(BuildContext context, String vetName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Chat with $vetName'),
        content: const Text('Chat interface placeholder - implement with messaging backend.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
        ],
      ),
    );
  }
}
