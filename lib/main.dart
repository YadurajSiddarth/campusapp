import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CampusHomeScreen(
        userName: 'Yaduraj Siddarth',
        studentId: '24BBTCS307',
        course: 'Computer Science',
        semester: 'Semester 5',
      ),
    ),
  );
}

class Student {
  final String name;
  final String studentId;
  final String course;
  final String semester;

  const Student({
    required this.name,
    required this.studentId,
    required this.course,
    required this.semester,
  });
}

/* 29th Sep by Raj Temporary removal of LoginScreen for testing purposes. Uncomment to enable login functionality.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/images/cmrl.png', height: 60),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 18,
                        offset: const Offset(10, 8),
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/campus.jpg',
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                        ),

                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.35),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const Positioned(
                          left: 20,
                          bottom: 16,
                          child: Text(
                            'WELCOME TO CAMPUS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const SizedBox(height: 24),

                Text(
                  'CMR University Student Hub',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cinzel(
                    color: const Color.fromARGB(255, 1, 11, 63),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Knowledge Breaks Barriers',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: const Color.fromARGB(255, 1, 11, 63),
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 45),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Your Name',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                TextField(
                  controller: courseController,
                  decoration: InputDecoration(
                    labelText: 'Course',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                TextField(
                  controller: semesterController,
                  decoration: InputDecoration(
                    labelText: 'Semester',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();

                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your name'),
                          ),
                        );
                        return;
                      }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CampusHomeScreen(
                            userName: name,
                            studentId: studentIdController.text.trim(),
                            course: courseController.text.trim(),
                            semester: semesterController.text.trim(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

class CampusHomeScreen extends StatefulWidget {
  final String userName;
  final String studentId;
  final String course;
  final String semester;

  const CampusHomeScreen({
    super.key,
    required this.userName,
    required this.studentId,
    required this.course,
    required this.semester,
  });

  @override
  _CampusHomeScreenState createState() => _CampusHomeScreenState();
}

class _CampusHomeScreenState extends State<CampusHomeScreen> {
  int _selectedIndex = 0;

  // List of titles to dynamically update the AppBar based on the selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 246, 247),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 243, 246),
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Image.asset('assets/images/cmrl.png', height: 42),

            const SizedBox(width: 12),

            Text(
              '',
              style: GoogleFonts.cinzel(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: [
          TextButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Search')));
            },
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 2, 4, 40),
            ),
            label: const Text(
              'Search',
              style: TextStyle(color: Color.fromARGB(255, 2, 3, 37)),
            ),
          ),

          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 2, 3, 37),
                ),
                tooltip: 'Menu',
              );
            },
          ),

          const SizedBox(width: 12),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Yaduraj Siddarth'),
              accountEmail: Text('yaduraj@university.edu'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/p.jpeg'),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 169, 226, 200),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Campus Map'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CampusMapScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings will be available soon.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //372 to 971 was previous code now got shrinked to 372 to 919

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // TAB 0: HOME
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // <-- Added missing Column here
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/campus.jpg',
                          width: double.infinity,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 280,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.75),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          right: 24,
                          bottom: 18,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CMR University',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 0),
                              const Text(
                                'Knowledge Breaks Barriers',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome back, ${widget.userName}!',
                    style: GoogleFonts.cinzel(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.studentId,
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.course} • ${widget.semester}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Academic Snapshot',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      Container(
                        width: 160,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.school, color: Colors.indigo),
                            const SizedBox(height: 10),
                            Text(
                              '8.69',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('CGPA'),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        margin: const EdgeInsets.only(right: 4),
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        constraints: const BoxConstraints(minHeight: 150),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.percent, color: Colors.green),
                            const SizedBox(height: 10),
                            Text(
                              '92%',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Attendance'),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueGrey.shade100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.credit_score,
                              color: Colors.orange,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '24',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Credits'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Announcement Section changed on 29th Sep by Raj

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 246),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blueGrey.shade100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Campus Announcement',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Career Fair registration is now open.',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Registration deadline: 15 October 2026',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Career Fair registration selected',
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.app_registration),
                              label: const Text('Register Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Quick Access',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Quick Access Horizontal List
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildQuickAccessCard(
                          Icons.local_library,
                          'Library',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LibraryScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),
                        _buildQuickAccessCard(Icons.map, 'Map', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CampusMapScreen(),
                            ),
                          );
                        }),
                        const SizedBox(width: 20),
                        _buildQuickAccessCard(
                          Icons.calendar_month,
                          'Timetable',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TimetableScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),
                        _buildQuickAccessCard(Icons.restaurant, 'Food', () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Campus Food')),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Upcoming Events',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildEventCard(
                          'assets/images/campus.jpg',
                          'Career Fair',
                          'Meet companies and explore opportunities.',
                        ),
                        const SizedBox(width: 16),
                        _buildEventCard(
                          'assets/images/sports.jpg',
                          'Sports Day',
                          'Annual university sports event.',
                        ),
                        const SizedBox(width: 16),
                        _buildEventCard(
                          'assets/images/techyy.jpg',
                          'Tech Fest',
                          'Technology, innovation and student projects.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Campus Highlights',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CampusHighlightsScreen(),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/IISc.jpg',
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            height: 220,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.75),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            right: 20,
                            bottom: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Life at CMR University',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Discover campus life, events, clubs and student activities.',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Campus Services',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildServiceCard(
                          'assets/images/library.jpg',
                          'Library',
                          'Books, study spaces and resources',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LibraryScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildServiceCard(
                          'assets/images/cafeteria.jpg',
                          'Cafeteria',
                          'Food and refreshments on campus',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CafeteriaScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildServiceCard(
                          'assets/images/spo.jpg',
                          'Sports',
                          'Sports facilities and activities',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SportsScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildServiceCard(
                          'assets/images/health.jpg',
                          'Health',
                          'Campus health and support',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HealthScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Important Contacts',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      _buildContactCard(
                        Icons.admin_panel_settings,
                        'University Administration',
                        'Contact administration for general queries',
                      ),
                      const SizedBox(height: 12),
                      _buildContactCard(
                        Icons.school,
                        'Academic Office',
                        'For academic and examination related queries',
                      ),
                      const SizedBox(height: 12),
                      _buildContactCard(
                        Icons.support_agent,
                        'Student Support',
                        'Get help with student services',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Latest Updates',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildUpdateCard(
                    Icons.campaign,
                    'Career Fair Registration',
                    'Registration is now open for the upcoming career fair.',
                  ),
                  const SizedBox(height: 12),
                  _buildUpdateCard(
                    Icons.event,
                    'Sports Day',
                    'Annual university sports day is coming soon.',
                  ),
                  const SizedBox(height: 12),
                  _buildUpdateCard(
                    Icons.computer,
                    'Tech Fest',
                    'Student registrations for Tech Fest are now available.',
                  ),
                ],
              ),
            ),
          ),

          // TAB 1: ACTIVITIES
          const ActivitiesScreen(),

          // TAB 2: PROFILE
          const ProfileScreen(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New task created successfully!')),
          );
        },
        backgroundColor: const Color.fromARGB(255, 180, 226, 177),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 224, 21, 21),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Activities'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 110,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 32,
              color: const Color.fromARGB(255, 175, 229, 241),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String imagePath, String title, String description) {
    return SizedBox(
      width: 280,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description, style: GoogleFonts.openSans(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    String imagePath,
    String title,
    String description, {
    VoidCallback? onTap,
  }) {
    return SizedBox(
      width: 260,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: GoogleFonts.openSans(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String description) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade100,
          ),
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(description, style: GoogleFonts.openSans(fontSize: 13)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$title selected')));
        },
      ),
    );
  }

  Widget _buildUpdateCard(IconData icon, String title, String description) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: Icon(icon, size: 28),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(description, style: GoogleFonts.openSans(fontSize: 13)),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// QUICK ACCESS SCREENS
// =====================================================

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: const Color.fromARGB(252, 212, 221, 238),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/library.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Campus Library',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Books, study spaces and learning resources for students.',
            style: GoogleFonts.openSans(fontSize: 16),
          ),
          const SizedBox(height: 20),

          TextField(
            decoration: InputDecoration(
              hintText: 'Search books or resources',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Card(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Books & Resources'),
              subtitle: const Text('Access books and academic resources.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Books & Resources selected')),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Study Spaces'),
              subtitle: const Text('Find a quiet place for studying.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Study Spaces selected')),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Library Hours'),
              subtitle: const Text(
                'Check the library opening and closing hours.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Library Hours selected')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CafeteriaScreen extends StatelessWidget {
  const CafeteriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafeteria'),
        backgroundColor: const Color.fromARGB(252, 212, 221, 238),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/cafeteria.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Campus Cafeteria',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 24),

          Text(
            'Today\'s Menu',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Breakfast'),
              subtitle: const Text('Available from 7:30 AM'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.lunch_dining),
              title: const Text('Lunch'),
              subtitle: const Text('Available from 12:00 PM'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.local_cafe),
              title: const Text('Snacks & Drinks'),
              subtitle: const Text('Available throughout the day'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports'),
        backgroundColor: const Color.fromARGB(252, 212, 221, 238),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/sports.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Campus Sports',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.sports_soccer),
              title: const Text('Football Ground'),
              subtitle: const Text('Outdoor football facility'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FootballScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.sports_cricket),
              title: const Text('Cricket Ground'),
              subtitle: const Text('Cricket ground and practice area'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.sports_basketball),
              title: const Text('Basketball Court'),
              subtitle: const Text('Outdoor basketball facility'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.sports_tennis),
              title: const Text('Tennis Court'),
              subtitle: const Text('Tennis facility for students'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.pool),
              title: const Text('Swimming Pool'),
              subtitle: const Text('Swimming and aquatic activities'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Athletics Ground'),
              subtitle: const Text('Running track and athletics facilities'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.sports),
              title: const Text('Badminton Court'),
              subtitle: const Text('Indoor badminton facility'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.sports_volleyball),
              title: const Text('Volleyball Court'),
              subtitle: const Text('Volleyball facility for students'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.table_bar),
              title: const Text('Table Tennis'),
              subtitle: const Text('Indoor table tennis facility'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Fitness & Indoor Sports'),
              subtitle: const Text('Gym and indoor recreational activities'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class FootballScreen extends StatelessWidget {
  const FootballScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Ground')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/footg.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Football Ground',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Outdoor football facility available for students, training sessions and campus activities.',
            style: GoogleFonts.openSans(fontSize: 16),
          ),

          const SizedBox(height: 24),

          Card(
            child: ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Opening Hours'),
              subtitle: const Text('6:00 AM – 9:00 PM'),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              subtitle: const Text('Campus Sports Complex'),
            ),
          ),
        ],
      ),
    );
  }
}

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health'),
        backgroundColor: const Color.fromARGB(252, 212, 221, 238),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/health.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Campus Health Support',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Health services and support available for students on campus.',
            style: GoogleFonts.openSans(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class CampusMapScreen extends StatelessWidget {
  const CampusMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Map'),
        backgroundColor: const Color.fromARGB(252, 212, 221, 238),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 100, color: Color.fromARGB(255, 178, 14, 2)),
            SizedBox(height: 20),
            Text(
              'Campus Map',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Campus map will be available here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
        backgroundColor: const Color.fromARGB(252, 212, 221, 238),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Semester 5 Timetable',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: Icon(Icons.computer),
              title: Text('Monday'),
              subtitle: Text('9:00 AM - 10:00 AM\nData Structures'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.storage),
              title: Text('Tuesday'),
              subtitle: Text(
                '10:00 AM - 11:00 AM\nDatabase Management Systems',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Wednesday'),
              subtitle: Text('11:00 AM - 12:00 PM\nSoftware Engineering'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.network_check),
              title: Text('Thursday'),
              subtitle: Text('9:00 AM - 10:00 AM\nComputer Networks'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.psychology),
              title: Text('Friday'),
              subtitle: Text('10:00 AM - 11:00 AM\nMachine Learning'),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// BOTTOM NAVIGATION SCREENS
// =====================================================

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text(
          'Campus Activities',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: Icon(Icons.sports),
            title: Text('Sports Day'),
            subtitle: Text('Annual university sports event'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.groups),
            title: Text('Student Club Meeting'),
            subtitle: Text('Join your favourite campus clubs'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.work),
            title: Text('Career Fair'),
            subtitle: Text('Meet companies and explore opportunities'),
          ),
        ),
      ],
    );
  }
}

/*class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Text('YS', style: TextStyle(fontSize: 30)),
          ),
          SizedBox(height: 20),
          Text(
            'Yaduraj Siddarth',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Computer Science'),
          Text('Semester 5'),
        ],
      ),
    );
  }
}
*/
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE HEADER
            Text(
              'STUDENT PROFILE',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.red.shade700,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Dashboard.',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              'Profile, academic overview and student activity.',
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 28),

            // MAIN PROFILE AREA
            LayoutBuilder(
              builder: (context, constraints) {
                final bool wideScreen = constraints.maxWidth >= 850;

                final profileCard = Container(
                  width: wideScreen ? 390 : double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.12),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // RED PROFILE HEADER
                      Container(
                        width: double.infinity,
                        height: 130,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 1, 3, 47),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),

                      // PROFILE PHOTO
                      Transform.translate(
                        offset: const Offset(0, -55),
                        child: Container(
                          width: 120,
                          height: 120,
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/p.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Transform.translate(
                        offset: const Offset(0, -35),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Text(
                                'Yaduraj Siddarth',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cinzel(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                'Computer Science',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 83, 5, 5),
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                'Semester 5 • Student ID CMR2026CSE001',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                              const SizedBox(height: 20),

                              Divider(color: Colors.grey.shade300),

                              const SizedBox(height: 12),

                              _profileInfoRow(
                                Icons.email_outlined,
                                'yadurajs@uni.edu.in',
                              ),

                              const SizedBox(height: 14),

                              _profileInfoRow(
                                Icons.school_outlined,
                                'CMR University',
                              ),

                              const SizedBox(height: 14),

                              _profileInfoRow(
                                Icons.location_on_outlined,
                                'Bengaluru, Karnataka',
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );

                final cards = Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _profileActionCard(
                            Icons.description_outlined,
                            'Performance',
                            'Academic record',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _profileActionCard(
                            Icons.verified_outlined,
                            'Academic Status',
                            'Current standing',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: _profileActionCard(
                            Icons.emoji_events_outlined,
                            'Achievements',
                            'Awards & certificates',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _profileActionCard(
                            Icons.code_outlined,
                            'Projects',
                            'Academic projects',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: _profileActionCard(
                            Icons.account_balance_wallet_outlined,
                            'Fee Status',
                            'Payments & balances',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _profileActionCard(
                            Icons.groups_outlined,
                            'Student Activities',
                            'Campus participation',
                          ),
                        ),
                      ],
                    ),
                  ],
                );

                if (wideScreen) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profileCard,
                      const SizedBox(width: 28),
                      Expanded(child: cards),
                    ],
                  );
                }

                return Column(
                  children: [profileCard, const SizedBox(height: 24), cards],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileActionCard(IconData icon, String title, String subtitle) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {},
      child: Container(
        constraints: const BoxConstraints(minHeight: 120),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: const Color.fromARGB(255, 4, 39, 109),
                size: 27,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: const Color.fromARGB(255, 73, 182, 232),
            ),
          ],
        ),
      ),
    );
  }
}

class CampusHighlightsScreen extends StatelessWidget {
  const CampusHighlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Highlights')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/IISc.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Life at CMR University',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Discover campus life, events, clubs and student activities.',
            style: GoogleFonts.openSans(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 28),

          const Text(
            'Campus Life',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const Text(
            'Explore the university campus, student activities, academic spaces and the experiences that make campus life memorable.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
