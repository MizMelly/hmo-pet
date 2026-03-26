import 'package:flutter/material.dart';
import '../services/auth_storage.dart';
import '../services/api_service.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false; // ✅ Loading state

  void _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and password are required')),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await ApiService.login(email, password);

      final token = response['token'] ?? response['data']?['token']; // ✅ Safe token check

      if (token != null) {
        await AuthStorage.saveToken(token); // ✅ Save token

        Navigator.of(context).pushReplacementNamed('/dashboard');
      } else {
        throw Exception("Token not found");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() => _isLoading = false);
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$");
    return regex.hasMatch(email);
  }

  @override
  void dispose() {
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
                            _leftPanel(),
                            Expanded(child: _formPanel(context)),
                          ],
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              _leftPanel(),
                              _formPanel(context),
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

  Widget _leftPanel() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2C6975), Color(0xFF84C9BD)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
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
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _formPanel(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Welcome back',
              style: TextStyle(
                color: Color(0xFF0F3E49),
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sign in to your Simba+ account',
              style: TextStyle(
                color: Color(0xFF2C6975),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            _socialButton(
              icon: Icons.g_translate,
              label: 'Continue with Google',
              color: const Color(0xFFDADFE6),
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _socialButton(
              icon: Icons.facebook,
              label: 'Continue with Facebook',
              color: const Color(0xFFDADFE6),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(child: Divider(color: Color(0xFFE0E8E7))),
                SizedBox(width: 8),
                Text(
                  'OR CONTINUE WITH EMAIL',
                  style: TextStyle(
                    color: Color(0xFF9FB8B4),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(child: Divider(color: Color(0xFFE0E8E7))),
              ],
            ),
            const SizedBox(height: 20),
            _inputField(
              controller: _emailController,
              label: 'Email',
              hint: 'you@example.com',
              icon: Icons.email,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Enter your email';
                }
                if (!_isValidEmail(value.trim())) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _inputField(
              controller: _passwordController,
              label: 'Password',
              hint: '••••••••',
              icon: Icons.lock,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Color(0xFF2C6975)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            FilledButton(
              key: const Key('login_submit'),
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _signIn();
                      }
                    },
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF2C6975),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Sign In', style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Don\'t have an account? Create account',
                  style: TextStyle(color: Color(0xFF2C6975), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: const Color(0xFF2C6975),
        side: const BorderSide(color: Color(0xFFB6D1CF)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      icon: Icon(icon, color: const Color(0xFF2C6975)),
      label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      onPressed: onTap,
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2C6975))),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
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