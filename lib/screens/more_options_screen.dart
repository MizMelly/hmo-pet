import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/auth_storage.dart';

class MoreOptionsScreen extends StatefulWidget {
  const MoreOptionsScreen({super.key});

  @override
  State<MoreOptionsScreen> createState() => _MoreOptionsScreenState();
}

class _MoreOptionsScreenState extends State<MoreOptionsScreen> {
  Map<String, dynamic>? userProfile;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    setState(() => _isLoading = true);

    try {
      final token = await AuthStorage.getToken();
      if (token == null) throw Exception("No token found");

      final profile = await ApiService.getProfile(token);
      setState(() {
        userProfile = profile;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  Future<void> _updateProfilePicture() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile picture update coming soon...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text('More Options', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color(0xFF2C6975),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : SingleChildScrollView(
                  padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                  child: Column(
                    children: [
                      _buildProfileCard(isSmallScreen),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _OptionCard(
                              title: 'Diary',
                              value: '15',
                              subtitle: 'Total Entries',
                              icon: Icons.book_outlined,
                              color: const Color(0xFF2C6975),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _OptionCard(
                              title: 'Settings',
                              value: '12',
                              subtitle: 'Preferences',
                              icon: Icons.settings_outlined,
                              color: const Color(0xFF2C6975),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      _buildMoreOptionsList(),
                    ],
                  ),
                ),
    );
  }

  Widget _buildProfileCard(bool isSmallScreen) {
    final name = userProfile?['fullname'] ?? userProfile?['name'] ?? 'Shokaris';
    final email = userProfile?['email'] ?? 'hannahj@email.com';
    final phone = userProfile?['phone'] ?? '+971 4234 4112';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: isSmallScreen ? 48 : 55,
                  backgroundColor: const Color(0xFFE6F0EE),
                  backgroundImage: const NetworkImage('https://via.placeholder.com/200'),
                ),
                GestureDetector(
                  onTap: _updateProfilePicture,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                    ),
                    child: const Icon(Icons.camera_alt, size: 20, color: Color(0xFF2C6975)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(email, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(child: _InfoBox(title: 'Age', value: '56 years')),
                const SizedBox(width: 12),
                Expanded(child: _InfoBox(title: 'Email', value: email)),
              ],
            ),
            const SizedBox(height: 12),
            _InfoBox(title: 'Phone Number', value: phone),

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
    );
  }

  Widget _buildMoreOptionsList() {
    return Column(
      children: [
        _ListOptionTile(icon: Icons.history, title: 'Transaction History', subtitle: 'View all payments and claims'),
        _ListOptionTile(icon: Icons.support_agent, title: 'Customer Support', subtitle: 'Chat with our team'),
        _ListOptionTile(icon: Icons.notifications, title: 'Notifications', subtitle: 'Manage alerts'),
        _ListOptionTile(
          icon: Icons.logout,
          title: 'Logout',
          subtitle: 'Sign out of your account',
          isDestructive: true,
          onTap: () async {
            await AuthStorage.clearToken();
            // No need for 'if (mounted)' check anymore
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            }
          },
        ),
      ],
    );
  }

  // Reusable Widgets
  Widget _InfoBox({required String title, required String value}) {
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

  Widget _SmallInfoBox({required String title, required String value}) {
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

// Keep your _OptionCard and _ListOptionTile as they were (with onTap)
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
              Icon(icon, size: 32, color: color),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 24),
          Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ListOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDestructive;
  final VoidCallback? onTap;

  const _ListOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isDestructive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : const Color(0xFF2C6975),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isDestructive ? Colors.red : Colors.black87,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}