import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'pets_screen.dart';
import 'health_records_screen.dart';
import 'hmo_screen.dart';
import 'more_options_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const PetsScreen(),
    const HealthRecordsScreen(),
    const HmoScreen(),
    const MoreOptionsScreen(),
  ];

  final List<String> _labels = ['Home', 'Pets', 'Records', 'HMO', 'More'];
  final List<IconData> _icons = [
    Icons.home,
    Icons.pets,
    Icons.health_and_safety,
    Icons.local_hospital,
    Icons.more_horiz,
  ];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF2C6975),
          unselectedItemColor: Colors.grey.shade500,
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: isSmallScreen ? 11 : 12,
          unselectedFontSize: isSmallScreen ? 10 : 11,
          iconSize: isSmallScreen ? 24 : 26,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: List.generate(5, (index) {
            final isSelected = _currentIndex == index;
            return BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(isSelected ? 6 : 0),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? const Color(0xFF2C6975).withOpacity(0.1)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _icons[index],
                  color: isSelected ? const Color(0xFF2C6975) : Colors.grey.shade500,
                ),
              ),
              activeIcon: Icon(
                _icons[index],
                color: const Color(0xFF2C6975),
              ),
              label: _labels[index],
            );
          }),
        ),
      ),
    );
  }
}