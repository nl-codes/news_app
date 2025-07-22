import 'package:flutter/material.dart';
import 'package:news_app/screens/profile/widget/next_button.dart';
import 'package:news_app/screens/profile/widget/profile_form_textfield.dart';
import 'package:news_app/screens/profile/widget/profile_header.dart';
import 'package:news_app/screens/profile/widget/profile_picture_containter.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({super.key});

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
                      ProfileHeader(),
                      SizedBox(height: 16),
                      ProfilePictureContainter(),
                      SizedBox(height: 16),
                      ProfileFormTextfield(
                        label: "Username",
                        isRequired: false,
                      ),
                      ProfileFormTextfield(
                        label: "Full name",
                        isRequired: false,
                      ),
                      ProfileFormTextfield(
                        label: "Email Address",
                        isRequired: true,
                      ),
                      ProfileFormTextfield(
                        label: "Phone Number",
                        isRequired: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
