import 'package:flutter/material.dart';

class HmoScreen extends StatefulWidget {
  const HmoScreen({super.key});

  @override
  State<HmoScreen> createState() => _HmoScreenState();
}

class _HmoScreenState extends State<HmoScreen> with SingleTickerProviderStateMixin {
  static const primary = Color(0xFF2C6975);
  static const lightBg = Color(0xFFF5F9FA);

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  // Mock Data
  final Plan currentPlan = Plan(
    name: "Simba Care Basic",
    price: 4000,
    visitsAllowed: 3,
    visitsUsed: 2,
    vaccines: 2,
  );

  final List<Plan> plans = [
    Plan(name: "Basic", price: 4000, visitsAllowed: 2, vaccines: 2),
    Plan(name: "Plus", price: 6500, visitsAllowed: 4, vaccines: 3),
    Plan(name: "Premium", price: 9000, visitsAllowed: 999, vaccines: 999),
  ];

  final List<Payment> payments = [
    Payment("Feb 1 2026", 4000, true),
    Payment("Jan 1 2026", 4000, true),
    Payment("Dec 1 2025", 4000, true),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  double get progress {
    if (currentPlan.visitsAllowed <= 0) {
      return 0.0;
    }
    return (currentPlan.visitsUsed / currentPlan.visitsAllowed).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: const Text(
          "HMO Plans",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            children: [
              _buildCurrentPlanCard(isSmallScreen),
              const SizedBox(height: 90),
              _sectionCard(
                title: "Plan Details",
                child: Column(
                  children: [
                    _row("Visits Allowed", "${currentPlan.visitsAllowed}/year"),
                    _row("Vaccines", "${currentPlan.vaccines}/year"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _sectionCard(
                title: "Payment History",
                child: Column(
                  children: payments.map((p) => _paymentTile(p)).toList(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPlanCard(bool isSmallScreen) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          bottom: -70,
          left: isSmallScreen ? 12 : 16,
          right: isSmallScreen ? 12 : 16,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFFE6F0EE), Colors.white],
              ),
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Current Plan",
                  style: TextStyle(color: primary, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  currentPlan.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "₦${currentPlan.price} / month",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: const Color(0xFFE6F0EE),
                    valueColor: const AlwaysStoppedAnimation(primary),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${currentPlan.visitsUsed} of ${currentPlan.visitsAllowed} visits used",
                  style: TextStyle(fontSize: 13, color: primary),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => _showUpgradeModal(context),
                    child: const Text(
                      "Upgrade Plan",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: primary.withOpacity(0.06), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: primary,
            ),
          ),
          const Divider(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _paymentTile(Payment p) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.receipt_long, color: primary, size: 28),
      title: Text(
        "${p.date}  •  ₦${p.amount}",
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        p.paid ? "Paid" : "Pending",
        style: TextStyle(
          color: p.paid ? Colors.green : Colors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _showUpgradeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose a Plan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...plans.map((plan) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    title: Text(plan.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text("${plan.visitsAllowed} visits • ${plan.vaccines} vaccines"),
                    trailing: Text(
                      "₦${plan.price}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Upgrading to ${plan.name}...")),
                      );
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// ==================== MODELS ====================
class Plan {
  final String name;
  final int price;
  final int visitsAllowed;
  final int vaccines;
  final int visitsUsed;

  const Plan({
    required this.name,
    required this.price,
    required this.visitsAllowed,
    required this.vaccines,
    this.visitsUsed = 0,
  });
}

class Payment {
  final String date;
  final int amount;
  final bool paid;

  const Payment(this.date, this.amount, this.paid);
}