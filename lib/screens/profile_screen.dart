// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF174A7C),
                child: Text(
                  'YS',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Yaduraj Siddarth',
                style: GoogleFonts.cinzel(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Computer Science • Semester 5',
                style: GoogleFonts.poppins(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 4),
              Text(
                'Student ID: 24BBTCS307',
                style: GoogleFonts.poppins(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 24),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('yadurajs@uni.edu.in'),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Programme'),
                  subtitle: Text('B.Tech Computer Science'),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
