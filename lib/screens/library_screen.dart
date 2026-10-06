// lib/screens/library_screen.dart
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Library'),
      backgroundColor: const Color(0xFF174A7C),
      foregroundColor: Colors.white,
    ),
    body: const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Central Library • Level 1\n\nBooks, journals, digital resources '
        'and quiet study spaces for all students.',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
    ),
  );
}
