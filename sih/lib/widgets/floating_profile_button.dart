import 'package:flutter/material.dart';

class FloatingProfileButton extends StatelessWidget {
  final String userName;
  final String avatarImage;

  const FloatingProfileButton({
    Key? key,
    required this.userName,
    required this.avatarImage,
  }) : super(key: key);

  void _showProfileSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 20,
                  spreadRadius: 6,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                // Profile row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        avatarImage,
                        width: 64, // 2 × radius
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // TODO: Implement view profile navigation
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.green),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Scrollable options list
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _profileOptions.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.grey[800],
                      indent: 70,
                      endIndent: 20,
                    ),
                    itemBuilder: (context, index) {
                      final option = _profileOptions[index];
                      return ListTile(
                        leading: Icon(
                          option.icon,
                          color: Colors.green,
                          size: 22,
                        ),
                        title: Text(
                          option.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        onTap: option.onTap ?? () {},
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Bottom actions
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement sign out logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Implement restore purchases logic
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.green),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Restore Purchases",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // TODO: Implement delete account logic
                  },
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.redAccent,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () => _showProfileSheet(context),
        child: ClipOval(
          child: Image.asset(
            avatarImage,
            width: 44, // size same as CircleAvatar (2 × radius)
            height: 44,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileOption {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  ProfileOption({required this.icon, required this.text, this.onTap});
}

final List<ProfileOption> _profileOptions = [
  ProfileOption(icon: Icons.edit, text: "Edit Profile"),
  ProfileOption(icon: Icons.settings, text: "App Settings"),
  ProfileOption(icon: Icons.privacy_tip, text: "Privacy"),
  ProfileOption(icon: Icons.credit_card, text: "Plans & Purchases"),
  ProfileOption(icon: Icons.link, text: "Integrations"),
  ProfileOption(icon: Icons.help, text: "FAQs"),
  ProfileOption(icon: Icons.support, text: "Support"),
  ProfileOption(icon: Icons.list_alt, text: "App Change Log"),
];
