import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 64),
          color: const Color.fromARGB(255, 221, 225, 220),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _heroText(context),
                    const SizedBox(height: 30),
                    _heroImage(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _heroText(context)),
                    Expanded(flex: 5, child: _heroImage()),
                  ],
                ),
        );
      },
    );
  }

  Widget _heroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFCDE0C9),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.pets, size: 20, color: Color(0xFF2C6975)),
              SizedBox(width: 10),
              Text('Pet Healthcare, Reimagined', style: TextStyle(color: Color(0xFF2C6975), fontWeight: FontWeight.w600, fontSize: 15)),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text('Healthcare for pets,\nmade simple', style: TextStyle(fontSize: 58, height: 1.05, fontWeight: FontWeight.bold, color: Color(0xFF2C6975))),
        const SizedBox(height: 24),
        const Text(
          'All-in-one pet health records, instant vet access, and affordable HMO plans — because your furry family deserves the best care.',
          style: TextStyle(fontSize: 18, height: 1.45, color: Color(0xFF2C6975)),
        ),
        const SizedBox(height: 48),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C6975),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Start Free Today', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF2C6975), width: 2.5),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Learn More', style: TextStyle(fontSize: 17, color: Color(0xFF2C6975), fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: const [
            StatItem(number: '2K+', label: 'Pet owners'),
            StatItem(number: '50+', label: 'Verified Vets'),
            StatItem(number: '98%', label: 'Satisfaction'),
          ],
        ),
      ],
    );
  }

  Widget _heroImage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset('assets/images/hero-pet.png', height: 420, fit: BoxFit.contain),
          const Positioned(
            top: 60,
            right: -20,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.medical_services_rounded, size: 46, color: Color(0xFF68B2AD)),
            ),
          ),
        ],
      ),
    );
  }
}