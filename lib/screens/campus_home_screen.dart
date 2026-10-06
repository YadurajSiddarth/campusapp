// lib/screens/campus_home_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/app_routes.dart';

class CampusHomeScreen extends StatefulWidget {
  const CampusHomeScreen({super.key});

  @override
  State<CampusHomeScreen> createState() => _CampusHomeScreenState();
}

class _CampusHomeScreenState extends State<CampusHomeScreen> {
  int _selectedIndex = 0;

  static const String userName = 'Yaduraj Siddarth';
  static const String studentId = '24BBTCS307';

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
        title: Text(
          'CampusConnect',
          style: GoogleFonts.cinzel(fontWeight: FontWeight.bold),
        ),
      ),

      // Body switches on the selected tab.
      body: _selectedIndex == 0
          ? const _DashboardTab()
          : _selectedIndex == 1
          ? const _ActivitiesTab()
          : const _ProfileTab(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFFC62828),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ---------- Dashboard Tab ----------

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF174A7C), Color(0xFF2E6FA8)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning, Yaduraj 👋',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Next class: Mobile Application Development • 10:00 AM • Lab 3',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Quick Access',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 1.15,
              children: [
                _NavCard(
                  icon: Icons.calendar_month,
                  label: 'Timetable',
                  color: const Color(0xFF174A7C),
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.timetable),
                ),
                _NavCard(
                  icon: Icons.miscellaneous_services,
                  label: 'Services',
                  color: const Color(0xFF00897B),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.services),
                ),
                _NavCard(
                  icon: Icons.event,
                  label: 'Events',
                  color: const Color(0xFF6A1B9A),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.events),
                ),
                _NavCard(
                  icon: Icons.person,
                  label: 'Profile',
                  color: const Color(0xFFEF6C00),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _NavCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivitiesTab extends StatelessWidget {
  const _ActivitiesTab();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Activities — coming soon'));
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Profile — see Quick Access card'));
}
