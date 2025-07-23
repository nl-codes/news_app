import 'package:flutter/material.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Navbar(),
              SettingTile(
                icon: Icons.notifications_outlined,
                title: "Notification",
                trailing: Icons.chevron_right,
              ),
              SettingTile(
                icon: Icons.lock_outline,
                title: "Security",
                trailing: Icons.chevron_right,
              ),
              DarkModeTile(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profile/edit'),
                child: SettingTile(
                  icon: Icons.edit,
                  title: "Edit Profile",
                  trailing: Icons.chevron_right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
                ),
                child: Row(children: [Icon(Icons.logout), Text("Logout")]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData trailing;

  const SettingTile({
    required this.icon,
    required this.title,
    required this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(icon), Text(title)]),
          Icon(trailing),
        ],
      ),
    );
  }
}

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(Icons.dark_mode_outlined), Text("Dark Mode")]),
          Icon(Icons.toggle_off_outlined, size: 32),
        ],
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        Text("Settings", style: TextStyle(fontSize: 18)),
        Icon(Icons.arrow_back, color: Colors.white),
      ],
    );
  }
}
