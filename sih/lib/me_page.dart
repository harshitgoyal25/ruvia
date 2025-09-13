import 'package:flutter/material.dart';
import 'widgets/bottomBar.dart';
import 'widgets/floating_profile_button.dart';

class MePage extends StatefulWidget {
  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  int _currentIndex = 1; // "Me" is at index 1

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
      // Feed not ready -> show popup
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
          "Ruvia",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // TODO: handle notification tap
          },
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
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/runner.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Gradient overlay
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
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Level card
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.directions_run,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      title: Text(
                        'Level 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '102XP to next level',
                        style: TextStyle(color: Colors.black54),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // XP Challenges
                  Card(
                    color: Colors.white.withOpacity(0.80),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'XP Challenges',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _ChallengeCard(
                                icon: Icons.camera_alt,
                                label: 'Add a profile picture',
                                xp: 20,
                              ),
                              _ChallengeCard(
                                icon: Icons.privacy_tip,
                                label: 'Set preference for privacy',
                                xp: 30,
                              ),
                              _ChallengeCard(
                                icon: Icons.person_add,
                                label: 'Follow on Instagram',
                                xp: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Competitions
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Competitions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Terra Comp 25.7 | \$2,988 AUD in Prizes',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              _CompetitionCard(
                                title: "THE BREATH HAUS",
                                time: "Ends: 20h 16m",
                              ),
                              SizedBox(width: 10),
                              _CompetitionCard(
                                title: "THE BREATH HAUS",
                                time: "Ends: 20h 16m",
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                            ),
                            child: const Text(
                              'View competition',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Local Battle
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.sports_kabaddi,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Local Battle',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            // Navigator.pushNamed(context, '/localBattle'); // Uncomment to navigate on tap
                          ),
                        ),
                        subtitle: const Text(
                          'Find nearby runners to compete!',
                          style: TextStyle(color: Colors.black54),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black54,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/localBattle');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Join/Create Club
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/joinClub');
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                            ),
                            child: const Text(
                              "Join a Club",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: null, // Disabled
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black87),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                            ),
                            child: const Text(
                              "Create Your Own Club",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Insights
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 24,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(22),
                          onTap: () {
                            Navigator.pushNamed(context, '/insights');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Insights:",
                                style: TextStyle(
                                  color: Colors.black,

                                  fontWeight: FontWeight.bold,
                                ),

                                // Navigate to Insights page on tap
                                // Already handled by InkWell's onTap above
                              ),
                              SizedBox(width: 14),
                              Icon(Icons.stars, color: Colors.amberAccent),
                              SizedBox(width: 10),
                              Text(
                                "Achievements / Stats",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
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

// --- helper widgets ---
class _ChallengeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int xp;

  const _ChallengeCard({
    required this.icon,
    required this.label,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.teal,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          '+$xp XP',
          style: const TextStyle(fontSize: 11, color: Colors.green),
        ),
      ],
    );
  }
}

class _CompetitionCard extends StatelessWidget {
  final String title, time;

  const _CompetitionCard({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 7),
          Text(
            time,
            style: const TextStyle(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
