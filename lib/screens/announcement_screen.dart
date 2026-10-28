import 'package:flutter/material.dart';

import '../models/campus_content.dart';
import 'announcement_detail_screen.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final Set<String> bookmarkedIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Announcements'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleAnnouncements.length,
        itemBuilder: (context, index) {
          final item = sampleAnnouncements[index];
          final saved = bookmarkedIds.contains(item.id);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF174A7C)
                    .withValues(alpha: 0.12),
                child: const Icon(
                  Icons.campaign_outlined,
                  color: Color(0xFF174A7C),
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text('${item.category} • ${item.date}\n${item.preview}'),
              ),
              isThreeLine: true,
              trailing: IconButton(
                tooltip: saved ? 'Remove bookmark' : 'Bookmark',
                icon: Icon(
                  saved ? Icons.bookmark : Icons.bookmark_border,
                  color: saved ? Colors.orange : null,
                ),
                onPressed: () {
                  setState(() {
                    if (saved) {
                      bookmarkedIds.remove(item.id);
                    } else {
                      bookmarkedIds.add(item.id);
                    }
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AnnouncementDetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
