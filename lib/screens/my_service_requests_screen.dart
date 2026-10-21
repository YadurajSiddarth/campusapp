import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyServiceRequestsScreen extends StatelessWidget {
  const MyServiceRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FA),
      appBar: AppBar(
        title: const Text('My Service Requests'),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: user == null
          ? const Center(child: Text('Please submit a request to get started.'))
          : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('serviceRequests')
                  .where('ownerUid', isEqualTo: user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Could not load requests.\n${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final requests = snapshot.data?.docs ?? [];

                if (requests.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 64,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No service requests yet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Your submitted requests will appear here.'),
                        ],
                      ),
                    ),
                  );
                }

                // Show newest requests first when timestamps are available.
                requests.sort((a, b) {
                  final aTime = a.data()['createdAt'];
                  final bTime = b.data()['createdAt'];

                  if (aTime is Timestamp && bTime is Timestamp) {
                    return bTime.compareTo(aTime);
                  }
                  return 0;
                });

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      '${requests.length} request${requests.length == 1 ? '' : 's'}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...requests.map((doc) {
                      final data = doc.data();
                      final status = (data['status'] as String?) ?? 'Pending';
                      final createdAt = data['createdAt'];
                      final submittedDate = createdAt is Timestamp
                          ? createdAt
                                .toDate()
                                .toLocal()
                                .toString()
                                .split(' ')
                                .first
                          : 'Just submitted';

                      return Card(
                        margin: const EdgeInsets.only(bottom: 14),
                        elevation: 1,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFFE4EDF7),
                                    child: Icon(
                                      Icons.miscellaneous_services,
                                      color: Color(0xFF174A7C),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (data['service'] as String?) ??
                                              'Campus service',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Reference: ${doc.id}',
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: status.toLowerCase() == 'resolved'
                                          ? Colors.green.shade100
                                          : status.toLowerCase() ==
                                                'in progress'
                                          ? Colors.orange.shade100
                                          : Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      status,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            status.toLowerCase() == 'resolved'
                                            ? Colors.green.shade900
                                            : status.toLowerCase() ==
                                                  'in progress'
                                            ? Colors.orange.shade900
                                            : Colors.blue.shade900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 28),
                              _detail(
                                'Subject',
                                (data['subject'] as String?) ?? 'Not provided',
                              ),
                              _detail(
                                'Urgency',
                                (data['urgency'] as String?) ?? 'Normal',
                              ),
                              _detail('Submitted', submittedDate),
                              if (data['details'] is String)
                                _detail('Details', data['details'] as String),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
    );
  }

  Widget _detail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
