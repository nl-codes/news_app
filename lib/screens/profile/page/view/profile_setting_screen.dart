import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/states/bloc/auth_bloc.dart';
import 'package:news_app/widgets/custom_snackbar.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, asyncSnapshot) {
            final authCubit = context.read<AuthCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Navbar(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/notification'),
                    child: SettingTile(
                      icon: Icons.notifications_outlined,
                      title: "Notification",
                      trailing: Icons.chevron_right,
                    ),
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
                    child: GestureDetector(
                      onTap: () {
                        authCubit.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (route) => false,
                        );
                        showCustomSnackbar(context, "You have been logged out");
                      },
                      child: Row(
                        children: [Icon(Icons.logout), Text("Logout")],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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

class DarkModeTile extends StatefulWidget {
  const DarkModeTile({super.key});

  @override
  State<DarkModeTile> createState() => _DarkModeTileState();
}

class _DarkModeTileState extends State<DarkModeTile> {
  bool isEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(Icons.dark_mode_outlined), Text("Dark Mode")]),
          GestureDetector(
            onTap: () {
              setState(() {
                isEnabled = !isEnabled;
              });
            },
            child: Icon(
              size: 32,
              isEnabled ? Icons.toggle_on_outlined : Icons.toggle_off_outlined,
            ),
          ),
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
