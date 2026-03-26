import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/main_nav_screen.dart';
import 'screens/pets_screen.dart';
import 'screens/health_records_screen.dart';
import 'screens/vet_access_screen.dart';
import 'screens/hmo_screen.dart';
import 'screens/more_options_screen.dart';
void main() {
  runApp(const SimbaApp());
}

class SimbaApp extends StatelessWidget {
  const SimbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simba+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 87, 137, 147),
        scaffoldBackgroundColor: const Color(0xFFE0ECDE),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/dashboard': (_) => const MainNavScreen(),
        '/pets': (_) => const PetsScreen(),           
        '/health-records': (_) => const HealthRecordsScreen(),
        '/vet-access': (_) => const VetAccessScreen(),
        '/hmo': (_) => const HmoScreen(),
        '/more-options': (_) => const MoreOptionsScreen(),
      },
    );
  }
}