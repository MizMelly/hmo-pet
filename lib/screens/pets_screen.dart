import 'package:flutter/material.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  final List<Pet> _pets = [
    Pet(name: 'Fluffy', species: 'Cat', age: '2 years', notes: 'Needs annual shots in April'),
    Pet(name: 'Milo', species: 'Dog', age: '4 years', notes: 'Knee check at end of month'),
    Pet(name: 'Luna', species: 'Rabbit', age: '1 year', notes: 'Regular grooming required'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text('My Pets', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF2C6975),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Pets",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 22 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "${_pets.length} Pets",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pet List
            ..._pets.map((pet) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _PetCard(pet: pet),
                )),

            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF2C6975),
        icon: const Icon(Icons.add),
        label: const Text('Add New Pet'),
        onPressed: () => _showAddPetModal(context),
      ),
    );
  }

  void _showAddPetModal(BuildContext context) {
    final nameController = TextEditingController();
    final speciesController = TextEditingController();
    final ageController = TextEditingController();
    final notesController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add New Pet",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Pet Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: speciesController,
                  decoration: const InputDecoration(
                    labelText: "Species (Cat, Dog, Rabbit, etc.)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: "Age (e.g. 2 years)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: notesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Notes / Special Care",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C6975),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        setState(() {
                          _pets.add(Pet(
                            name: nameController.text,
                            species: speciesController.text.isEmpty ? "Unknown" : speciesController.text,
                            age: ageController.text.isEmpty ? "Unknown" : ageController.text,
                            notes: notesController.text,
                          ));
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Pet added successfully!')),
                        );
                      }
                    },
                    child: const Text('Add Pet', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Pet Model
class Pet {
  final String name;
  final String species;
  final String age;
  final String notes;

  Pet({
    required this.name,
    required this.species,
    required this.age,
    required this.notes,
  });
}

// Responsive Pet Card
class _PetCard extends StatelessWidget {
  final Pet pet;

  const _PetCard({required this.pet});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: isSmallScreen ? 60 : 70,
              height: isSmallScreen ? 60 : 70,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F0EE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.pets,
                size: isSmallScreen ? 32 : 38,
                color: const Color(0xFF2C6975),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pet.name,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 18 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F0EE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          pet.species,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C6975),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    pet.age,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    pet.notes,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}