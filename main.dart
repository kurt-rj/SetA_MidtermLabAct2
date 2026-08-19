import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B4332),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // ---- EDIT YOUR DETAILS HERE ----
  static const String fullName = 'Juan Carlos';
  static const String nickname = 'CJ';
  static const String age = '20';
  static const String birthday = 'January 1, 2006';
  static const String address = 'City of Cabuyao, Laguna';
  static const String hobby = 'Building personal web & app projects';
  static const String motto = '"Code it, break it, fix it, ship it."';
  static const String course = 'BS Information Technology';
  static const String yearLevel = '3rd Year';
  static const String section = 'BSIT 3-1';

  static const List<Map<String, dynamic>> academicInfo = [
    {'icon': Icons.book, 'label': 'Favorite Subject', 'value': 'System Integration and Architecture'},
    {'icon': Icons.code, 'label': 'Programming Language', 'value': 'Kotlin, Dart, PHP'},
    {'icon': Icons.build, 'label': 'Technical Skill', 'value': 'Mobile App Development'},
    {'icon': Icons.flag, 'label': 'Career Goal', 'value': 'Software Developer'},
  ];
  // ---------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4332),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('Personal Information', Icons.person),
                  const SizedBox(height: 8),
                  _buildPersonalInfoCard(),
                  const SizedBox(height: 24),
                  _sectionTitle('Academic Information', Icons.school),
                  const SizedBox(height: 8),
                  _buildAcademicInfoCard(),
                  const SizedBox(height: 24),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- HEADER WITH PROFILE PICTURE ----
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFE9F5EE),
              // Replace with: backgroundImage: AssetImage('assets/profile.jpg'),
              child: Icon(Icons.person, size: 70, color: Color(0xFF1B4332)),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            fullName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '"$nickname"',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(
                '$course · $yearLevel · $section',
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Banner image (replace URL with your own school/course badge if desired)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://placehold.co/240x60/2D6A4F/FFFFFF?text=University+of+Cabuyao',
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  // ---- SECTION TITLE ----
  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF1B4332), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B4332),
          ),
        ),
      ],
    );
  }

  // ---- PERSONAL INFO CARD ----
  Widget _buildPersonalInfoCard() {
    final items = [
      {'icon': Icons.cake, 'label': 'Age', 'value': age},
      {'icon': Icons.calendar_today, 'label': 'Birthday', 'value': birthday},
      {'icon': Icons.home, 'label': 'Address', 'value': address},
      {'icon': Icons.favorite, 'label': 'Hobby', 'value': hobby},
      {'icon': Icons.format_quote, 'label': 'Motto', 'value': motto},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          return Column(
            children: [
              ListTile(
                leading: Icon(item['icon'] as IconData, color: const Color(0xFF2D6A4F)),
                title: Text(
                  item['label'] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                subtitle: Text(
                  item['value'] as String,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              if (i != items.length - 1) const Divider(height: 1, indent: 16, endIndent: 16),
            ],
          );
        }),
      ),
    );
  }

  // ---- ACADEMIC INFO CARD ----
  Widget _buildAcademicInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: academicInfo.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F5EE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(item['icon'] as IconData, color: const Color(0xFF1B4332), size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['label'] as String,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          item['value'] as String,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ---- ACTION BUTTONS ----
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B4332),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact info coming soon!')),
              );
            },
            icon: const Icon(Icons.email, size: 18),
            label: const Text('Contact Me'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF1B4332),
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Color(0xFF1B4332)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('About This App'),
                  content: const Text(
                    'This Student Profile Application was built using Flutter '
                    'for ITP107 Midterm Laboratory Activity 2.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.info_outline, size: 18),
            label: const Text('About'),
          ),
        ),
      ],
    );
  }
}
