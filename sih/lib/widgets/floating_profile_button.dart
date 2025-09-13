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
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, -3),
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
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                // Profile row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(avatarImage),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.black87,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // TODO: Implement view profile navigation
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black54),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.black87,
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
                      color: Colors.grey[300],
                      indent: 70,
                      endIndent: 20,
                    ),
                    itemBuilder: (context, index) {
                      final option = _profileOptions[index];
                      return ListTile(
                        leading: Icon(
                          option.icon,
                          color: Colors.black87,
                          size: 22,
                        ),
                        title: Text(
                          option.text,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black38,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        onTap:
                            option.onTap ??
                            () {
                              // Default empty tap
                            },
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
                      backgroundColor: Colors.teal[700],
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
                        color: Colors.white,
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
                      side: BorderSide(color: Colors.grey.shade400),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Restore Purchases",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // TODO: Implement delete account logic
                  },
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.grey[600],
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
        child: CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(avatarImage),
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
  ProfileOption(
    icon: Icons.edit,
    text: "Edit Profile",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.settings,
    text: "App Settings",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.privacy_tip,
    text: "Privacy",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.credit_card,
    text: "Plans & Purchases",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.link,
    text: "Integrations",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.help,
    text: "FAQs",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.support,
    text: "Support",
    onTap: () {
      /* TODO */
    },
  ),
  ProfileOption(
    icon: Icons.list_alt,
    text: "App Change Log",
    onTap: () {
      /* TODO */
    },
  ),
];
