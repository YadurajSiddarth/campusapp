// lib/screens/services_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/campus_service.dart';
import '../routes/app_routes.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String _query = '';

  List<CampusService> get _filtered => sampleServices
      .where((s) => s.name.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Services'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: 'Search campus services',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            Expanded(
              child: _filtered.isEmpty
                  ? const Center(child: Text('No services match your search.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        final service = _filtered[index];
                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: CircleAvatar(
                              backgroundColor: service.color.withOpacity(0.15),
                              child: Icon(service.icon, color: service.color),
                            ),
                            title: Text(
                              service.name,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              service.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),

                            // Push the detail route and pass the selected
                            // CampusService object as an argument.
                            onTap: () async {
                              final result = await Navigator.pushNamed(
                                context,
                                AppRoutes.serviceDetail,
                                arguments: service,
                              );

                              // Show visible confirmation if a result
                              // was returned from the detail route.
                              if (!context.mounted) return;
                              if (result is String) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(result)));
                              }
                            },
                          ),
                        );
                      },
                    ),
            ),

            // Return to dashboard with a simple pop — never push a new Home.
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to Dashboard'),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF174A7C),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
