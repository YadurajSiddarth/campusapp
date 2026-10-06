// lib/models/campus_service.dart

import 'package:flutter/material.dart';

/// Data model for a campus service.
/// Passed to ServiceDetailScreen via route arguments.
class CampusService {
  final String name;
  final String description;
  final String location;
  final String openingHours;
  final String contact;
  final IconData icon;
  final Color color;
  final String status;

  const CampusService({
    required this.name,
    required this.description,
    required this.location,
    required this.openingHours,
    required this.contact,
    required this.icon,
    required this.color,
    this.status = 'Open now',
  });
}

/// Local sample data — no database or API required.
const List<CampusService> sampleServices = [
  CampusService(
    name: 'Accommodation Office',
    description: 'Housing support, maintenance requests and room allocation.',
    location: 'Student Centre, Level 2',
    openingHours: '8:30 AM – 5:00 PM',
    contact: 'housing@cmr.edu.in',
    icon: Icons.home_work,
    color: Color(0xFF174A7C),
  ),
  CampusService(
    name: 'Student Counselling',
    description: 'Confidential wellbeing support and academic guidance.',
    location: 'Wellness Block, Room 104',
    openingHours: '9:00 AM – 4:30 PM',
    contact: 'counselling@cmr.edu.in',
    icon: Icons.psychology,
    color: Color(0xFF00897B),
  ),
  CampusService(
    name: 'IT Helpdesk',
    description: 'Account access, Wi-Fi, and device support for students.',
    location: 'Tech Park, Ground Floor',
    openingHours: '8:00 AM – 6:00 PM',
    contact: 'helpdesk@cmr.edu.in',
    icon: Icons.computer,
    color: Color(0xFF6A1B9A),
  ),
  CampusService(
    name: 'Library Services',
    description: 'Book lending, digital resources and study spaces.',
    location: 'Central Library, Level 1',
    openingHours: '7:30 AM – 9:00 PM',
    contact: 'library@cmr.edu.in',
    icon: Icons.local_library,
    color: Color(0xFFEF6C00),
  ),
  CampusService(
    name: 'Health Centre',
    description: 'First aid, health checks and campus medical support.',
    location: 'Sports Complex, Room 12',
    openingHours: '8:00 AM – 8:00 PM',
    contact: 'health@cmr.edu.in',
    icon: Icons.local_hospital,
    color: Color(0xFFC62828),
  ),
  CampusService(
    name: 'Cafeteria',
    description: 'Daily meals, snacks and refreshments across campus.',
    location: 'Food Court, Block C',
    openingHours: '7:30 AM – 8:00 PM',
    contact: 'cafeteria@cmr.edu.in',
    icon: Icons.restaurant,
    color: Color(0xFF2E7D32),
  ),
];

/// Data model for campus events.
class CampusEvent {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String description;
  final bool registrationOpen;

  const CampusEvent({
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.description,
    this.registrationOpen = true,
  });
}

const List<CampusEvent> sampleEvents = [
  CampusEvent(
    title: 'Career Fair 2026',
    date: '15 October 2026',
    time: '10:00 AM – 4:00 PM',
    venue: 'Main Auditorium',
    description: 'Meet recruiters from 40+ companies and explore internship and job opportunities.',
  ),
  CampusEvent(
    title: 'Sports Day',
    date: '22 October 2026',
    time: '8:00 AM – 5:00 PM',
    venue: 'Athletics Ground',
    description: 'Annual inter-department sports championship with track, field and team events.',
  ),
  CampusEvent(
    title: 'Tech Fest',
    date: '5 November 2026',
    time: '9:00 AM – 6:00 PM',
    venue: 'Innovation Centre',
    description: 'Student projects, hackathons, robotics and guest talks from industry leaders.',
  ),
  CampusEvent(
    title: 'Cultural Night',
    date: '12 November 2026',
    time: '6:00 PM – 9:30 PM',
    venue: 'Open Air Theatre',
    description: 'Music, dance and drama performances by student clubs and visiting artists.',
    registrationOpen: false,
  ),
];
