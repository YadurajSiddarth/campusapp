// lib/screens/event_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/campus_service.dart';

class EventDetailScreen extends StatelessWidget {
  final CampusEvent event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _row(Icons.calendar_month, event.date),
              const SizedBox(height: 8),
              _row(Icons.access_time, event.time),
              const SizedBox(height: 8),
              _row(Icons.location_on, event.venue),
              const SizedBox(height: 24),
              Text(
                event.description,
                style: GoogleFonts.poppins(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: event.registrationOpen
                      ? () => Navigator.pop(
                          context,
                          'Registered for ${event.title}.',
                        )
                      : null,
                  icon: const Icon(Icons.app_registration),
                  label: Text(
                    event.registrationOpen
                        ? 'Register for this event'
                        : 'Registration closed',
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF174A7C)),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: GoogleFonts.poppins(fontSize: 14))),
      ],
    );
  }
}
