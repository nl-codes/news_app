import 'package:flutter/material.dart';
import 'package:news_app/screens/forgot_password/widget/fp_submit_button.dart';
import 'package:news_app/screens/forgot_password/widget/recover_by_card.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String selectedMethod = "Email";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Forgot",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Password ?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Don’t worry! it happens. Please select the email or number associated with your account.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMethod = "Email";
                        });
                      },
                      child: RecoverByCard(
                        iconData: Icons.email_outlined,
                        recoverMethod: "Email",
                        recoverDetails: "recovery@email.com",
                        isSelected: selectedMethod == "Email",
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMethod = "SMS";
                        });
                      },
                      child: RecoverByCard(
                        iconData: Icons.message_outlined,
                        recoverMethod: "SMS",
                        recoverDetails: "+977 9812345678",
                        isSelected: selectedMethod == "SMS",
                      ),
                    ),
                  ],
                ),
              ),
              FpSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
