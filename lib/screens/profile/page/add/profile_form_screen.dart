import 'package:flutter/material.dart';
import 'package:news_app/screens/profile/widget/next_button.dart';
import 'package:news_app/screens/profile/widget/profile_form_textfield.dart';
import 'package:news_app/screens/profile/widget/profile_header.dart';
import 'package:news_app/screens/profile/widget/profile_picture_containter.dart';

class ProfileFormScreen extends StatelessWidget {
  ProfileFormScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                        fieldController: usernameController,
                      ),
                      ProfileFormTextfield(
                        label: "Full name",
                        isRequired: false,
                        fieldController: fullNameController,
                      ),
                      ProfileFormTextfield(
                        label: "Email Address",
                        isRequired: true,
                        fieldController: emailController,
                      ),
                      ProfileFormTextfield(
                        label: "Phone Number",
                        isRequired: true,
                        fieldController: phoneController,
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
