// lib/screens/timetable_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  static const List<Map<String, String>> _classes = [
    {
      'day': 'Monday',
      'time': '9:00 AM',
      'module': 'Data Structures',
      'room': 'Lab 3',
    },
    {
      'day': 'Tuesday',
      'time': '10:00 AM',
      'module': 'Database Systems',
      'room': 'Room 201',
    },
    {
      'day': 'Wednesday',
      'time': '11:00 AM',
      'module': 'Software Engineering',
      'room': 'Room 105',
    },
    {
      'day': 'Thursday',
      'time': '9:00 AM',
      'module': 'Computer Networks',
      'room': 'Lab 1',
    },
    {
      'day': 'Friday',
      'time': '10:00 AM',
      'module': 'Machine Learning',
      'room': 'Room 304',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _classes.length,
        itemBuilder: (context, i) {
          final c = _classes[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF174A7C).withOpacity(0.12),
                child: Text(
                  c['day']!.substring(0, 2),
                  style: const TextStyle(
                    color: Color(0xFF174A7C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                c['module']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('${c['time']} • ${c['room']}'),
            ),
          );
        },
      ),
    );
  }
}
