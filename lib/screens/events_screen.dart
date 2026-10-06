// lib/screens/events_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/campus_service.dart';
import '../routes/app_routes.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleEvents.length,
        itemBuilder: (context, index) {
          final event = sampleEvents[index];

          // Event tiles open a details route using named route + arguments.
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF6A1B9A).withOpacity(0.15),
                child: const Icon(Icons.event, color: Color(0xFF6A1B9A)),
              ),
              title: Text(
                event.title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('${event.date} • ${event.time}\n${event.venue}'),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.eventDetail,
                arguments: event,
              ),
            ),
          );
        },
      ),
    );
  }
}
