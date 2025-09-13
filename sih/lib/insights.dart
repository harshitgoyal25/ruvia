import 'package:flutter/material.dart';
import 'widgets/bottomBar.dart';
import 'widgets/floating_profile_button.dart';

class InsightsPage extends StatefulWidget {
  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  int _currentIndex = 1;

  void _onTabSelected(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    } else if (index == 1) {
      // Already on Me
    } else if (index == 2) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Coming Soon"),
          content: const Text(
            "The Feed feature will be available in the next update.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else if (index == 3) {
      // Navigator.pushNamed(context, '/start-run');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 172, 161),
        elevation: 3,
        title: const Text(
          "Insights",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: FloatingProfileButton(
              userName: "Harsh Kumar",
              avatarImage: "assets/avator.png",
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/runner.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.40),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF43e97b).withOpacity(0.5),
                  const Color(0xFF38f9d7).withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Achievements Section
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Achievements',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _AchievementCard(
                            icon: Icons.emoji_events,
                            title: 'Marathon Finisher',
                            description:
                                'Completed a full marathon in under 4 hours.',
                            progress: 1.0,
                          ),
                          const SizedBox(height: 12),
                          _AchievementCard(
                            icon: Icons.directions_run,
                            title: '100km Running',
                            description:
                                'Accumulated 100km of running this year.',
                            progress: 0.65,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Stats Section
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Stats',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _StatTile(
                            label: 'Total Runs',
                            value: '45',
                            icon: Icons.timeline,
                          ),
                          _StatTile(
                            label: 'Total Distance',
                            value: '320 km',
                            icon: Icons.map,
                          ),
                          _StatTile(
                            label: 'Personal Best',
                            value: '5 min/km',
                            icon: Icons.speed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double progress;

  const _AchievementCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.teal.withOpacity(0.3),
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal.withOpacity(0.2),
        child: Icon(icon, color: Colors.teal),
      ),
      title: Text(label, style: const TextStyle(color: Colors.black87)),
      trailing: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
