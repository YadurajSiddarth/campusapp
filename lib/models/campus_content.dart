class Announcement {
  final String id;
  final String title;
  final String category;
  final String date;
  final String preview;
  final String detail;

  const Announcement({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.preview,
    required this.detail,
  });
}

const List<Announcement> sampleAnnouncements = [
  Announcement(
    id: 'ann1',
    title: 'Library Hours Extended',
    category: 'Campus Notice',
    date: '28 October 2026',
    preview: 'The library will offer extended study hours.',
    detail: 'The central library will offer extended study hours to help students prepare for upcoming assessments.',
  ),
  Announcement(
    id: 'ann2',
    title: 'Career Fair Registration',
    category: 'Career',
    date: '27 October 2026',
    preview: 'Register your interest in upcoming career activities.',
    detail: 'Students can register their interest in career activities and prepare their resumes for employer interactions.',
  ),
  Announcement(
    id: 'ann3',
    title: 'Sports Club Enrollment',
    category: 'Sports',
    date: '26 October 2026',
    preview: 'Explore campus sports clubs and activities.',
    detail: 'Students interested in sports can explore available clubs and contact the sports office for enrollment details.',
  ),
  Announcement(
    id: 'ann4',
    title: 'IT Helpdesk Support',
    category: 'IT Services',
    date: '25 October 2026',
    preview: 'Find support for campus accounts and Wi-Fi.',
    detail: 'Students can contact the IT Helpdesk for assistance with campus accounts, Wi-Fi access and technical issues.',
  ),
  Announcement(
    id: 'ann5',
    title: 'Student Counselling',
    category: 'Student Support',
    date: '24 October 2026',
    preview: 'Learn about available student wellbeing support.',
    detail: 'Students can contact the counselling office for confidential wellbeing support and academic guidance.',
  ),
  Announcement(
    id: 'ann6',
    title: 'Accommodation Information',
    category: 'Accommodation',
    date: '23 October 2026',
    preview: 'Review housing support and accommodation services.',
    detail: 'The accommodation office provides information about housing support, room allocation and maintenance requests.',
  ),
  Announcement(
    id: 'ann7',
    title: 'Campus Technology Workshop',
    category: 'Workshop',
    date: '22 October 2026',
    preview: 'Discover opportunities to develop technical skills.',
    detail: 'Students can explore practical technology workshops and learn about upcoming learning opportunities on campus.',
  ),
  Announcement(
    id: 'ann8',
    title: 'Student Activities Update',
    category: 'Student Life',
    date: '21 October 2026',
    preview: 'Stay informed about campus activities.',
    detail: 'Check campus activity announcements regularly for updates about student clubs, events and activities.',
  ),
];
