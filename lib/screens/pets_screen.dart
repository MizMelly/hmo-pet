import 'package:flutter/material.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text(
          'My Pets',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF2C6975),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _PetCard(
            name: 'Fluffy',
            species: 'Cat',
            age: '2 years',
            notes: 'Needs annual shots in April',
          ),
          _PetCard(
            name: 'Milo',
            species: 'Dog',
            age: '4 years',
            notes: 'Knee check at end of month',
          ),
          _PetCard(
            name: 'Luna',
            species: 'Rabbit',
            age: '1 year',
            notes: 'Regular grooming required',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2C6975),
        onPressed: () {
          // Add new pet logic here later
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _PetCard extends StatelessWidget {
  final String name;
  final String species;
  final String age;
  final String notes;

  const _PetCard({
    required this.name,
    required this.species,
    required this.age,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.pets, color: Color(0xFF2C6975)),
              ],
            ),
            const SizedBox(height: 8),
            Text('$species • $age', style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text(
              notes,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}