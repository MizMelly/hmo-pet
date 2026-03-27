import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/auth_storage.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  // ✅ Updated _register method
  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // ✅ Corrected: Using named parameters to match ApiService
      final response = await ApiService.register(
        fullname: _fullnameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Handle different possible token structures
      final token = response['token'] ??
          response['data']?['token'] ??
          response['access_token'];

      if (token != null && token.toString().isNotEmpty) {
        await AuthStorage.saveToken(token.toString());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        throw Exception("Token not returned from server");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  bool _isValidEmail(String email) =>
      RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$").hasMatch(email);

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAF8),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            return Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 6,
                  color: Colors.white,
                  child: isWide
                      ? Row(
                          children: [
                            Expanded(flex: 5, child: _leftPanel(isWide: true)),
                            Expanded(flex: 5, child: _formPanel()),
                          ],
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              _leftPanel(isWide: false),
                              _formPanel(),
                            ],
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _leftPanel({required bool isWide}) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2C6975), Color(0xFF84C9BD)],
        ),
        borderRadius: isWide
            ? const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.favorite, size: 56, color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Simba+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 56,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Healthcare for pets,\nmade simple and affordable',
              style: TextStyle(color: Colors.white70, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _formPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF2C6975)),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Back to login',
                  style: TextStyle(
                    color: Color(0xFF2C6975),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Create account',
              style: TextStyle(
                color: Color(0xFF0F3E49),
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Join Simba+ and care for your pet',
              style: TextStyle(color: Color(0xFF2C6975), fontSize: 20),
            ),
            const SizedBox(height: 20),
            _inputField(
              _fullnameController,
              'Full Name',
              'John Doe',
              Icons.person,
            ),
            const SizedBox(height: 16),
            _inputField(
              _emailController,
              'Email',
              'you@example.com',
              Icons.email,
            ),
            const SizedBox(height: 16),
            _inputField(
              _passwordController,
              'Password',
              '••••••••',
              Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isLoading ? null : _register,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF2C6975),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Already have an account? Sign in',
                  style: TextStyle(
                    color: Color(0xFF2C6975),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    TextEditingController controller,
    String label,
    String hint,
    IconData icon, {
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C6975),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (v) {
            if (v == null || v.isEmpty) return 'Enter $label';
            if (label == 'Email' && !_isValidEmail(v)) return 'Invalid email';
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF7FBFA),
            prefixIcon: Icon(icon, color: const Color(0xFF2C6975)),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}