import 'package:flutter/material.dart';
import '../services/auth_storage.dart';
import '../services/api_service.dart';

class HmoScreen extends StatefulWidget {
  const HmoScreen({super.key});

  @override
  State<HmoScreen> createState() => _HmoScreenState();
}

class _HmoScreenState extends State<HmoScreen>
    with SingleTickerProviderStateMixin {
  static const primary = Color(0xFF2C6975);
  static const lightBg = Color(0xFFF5F9FA);

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  /// 🔷 MOCK DATA (Replace with API later)
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

    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  double get progress =>
      currentPlan.visitsUsed / currentPlan.visitsAllowed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
  backgroundColor: primary,
  elevation: 0,
  title: const Text("HMO Plans",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
  centerTitle: true,
),

      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🔷 HEADER
              Stack(
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

                  /// 🔷 FLOATING CARD
                  Positioned(
                    bottom: -80,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE6F0EE), Colors.white],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.1),
                            blurRadius: 12,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text("Current Plan",
                              style: TextStyle(color: primary)),

                          const SizedBox(height: 6),

                          Text(currentPlan.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: primary)),

                          const SizedBox(height: 6),

                          Text("₦${currentPlan.price} / month"),

                          const SizedBox(height: 12),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 10,
                              backgroundColor: const Color(0xFFE6F0EE),
                              valueColor:
                                  const AlwaysStoppedAnimation(primary),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "${currentPlan.visitsUsed} of ${currentPlan.visitsAllowed} visits used",
                            style: const TextStyle(fontSize: 12, color: primary),
                          ),

                          const SizedBox(height: 12),

                          /// 🔥 UPGRADE BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              _showUpgradeModal(context);
                            },
                            child: const Text("Upgrade Plan"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),

              /// 🔷 BODY
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _sectionCard(
                      title: "Plan Details",
                      child: Column(
                        children: [
                          _row("Visits", "${currentPlan.visitsAllowed}/year"),
                          _row("Vaccines", "${currentPlan.vaccines}/year"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    _sectionCard(
                      title: "Payment History",
                      child: Column(
                        children: payments
                            .map((p) => _paymentTile(p))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🔷 MODAL (UPGRADE)
  void _showUpgradeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: plans.map((plan) {
              return ListTile(
                title: Text(plan.name),
                subtitle: Text("${plan.visitsAllowed} visits"),
                trailing: Text("₦${plan.price}"),
                onTap: () {
                  Navigator.pop(context);
                  // 🔥 Hook API here
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: primary.withOpacity(0.05), blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: primary)),
          const Divider(),
          child,
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }

  Widget _paymentTile(Payment p) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.receipt, color: primary),
      title: Text("${p.date} – ₦${p.amount}"),
      trailing: Text(
        p.paid ? "Paid" : "Pending",
        style: TextStyle(color: p.paid ? Colors.green : Colors.orange),
      ),
    );
  }
}

/// 🔷 MODELS (API READY)
class Plan {
  final String name;
  final int price;
  final int visitsAllowed;
  final int vaccines;
  final int visitsUsed;

  Plan({
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

  Payment(this.date, this.amount, this.paid);
}