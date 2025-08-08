import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/screens/profile/widget/profile_form_textfield.dart';
// import 'package:news_app/screens/profile/widget/profile_header.dart';
import 'package:news_app/screens/profile/widget/profile_picture_containter.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  var box = Hive.box('Flutter');
  String username = "user";
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back),
                          ),
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              final newName = usernameController.text.trim();
                              box.put('username', newName);
                              Navigator.pushNamed(context, '/explore');
                            },
                            child: Icon(Icons.done),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ProfilePictureContainter(),
                      SizedBox(height: 16),
                      ProfileFormTextfield(
                        label: "Username",
                        isRequired: false,
                        fieldController: usernameController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ProfileFormTextfield(
                      //   label: "Full name",
                      //   isRequired: false,
                      // ),
                      // ProfileFormTextfield(
                      //   label: "Email Address",
                      //   isRequired: true,
                      // ),
                      // ProfileFormTextfield(
                      //   label: "Phone Number",
                      //   isRequired: true,
                      // ),
                      // ProfileFormTextfield(label: "Bio", isRequired: false),
                      // ProfileFormTextfield(label: "Website", isRequired: false),
