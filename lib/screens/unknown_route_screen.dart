// lib/screens/unknown_route_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/app_routes.dart';

class UnknownRouteScreen extends StatelessWidget {
  final String? routeName;

  const UnknownRouteScreen({super.key, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Not Found'),
        backgroundColor: const Color(0xFFC62828),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                '404 — Unknown Route',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Could not open: ${routeName ?? "(null)"}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                ),
                icon: const Icon(Icons.home),
                label: const Text('Go to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
