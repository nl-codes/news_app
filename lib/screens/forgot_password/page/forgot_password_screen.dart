import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      child: _RecoverByCard(
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
                      child: _RecoverByCard(
                        iconData: Icons.message_outlined,
                        recoverMethod: "SMS",
                        recoverDetails: "+977 9812345678",
                        isSelected: selectedMethod == "SMS",
                      ),
                    ),
                  ],
                ),
              ),
              _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecoverByCard extends StatelessWidget {
  final IconData iconData;
  final String recoverMethod;
  final String recoverDetails;
  final bool isSelected;

  const _RecoverByCard({
    required this.iconData,
    required this.recoverMethod,
    required this.recoverDetails,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(iconData, color: Colors.white, size: 20),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("via $recoverMethod:"),
                Text(
                  recoverDetails,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Icon(
            color: Colors.blueAccent,
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text("SUBMIT"),
        onPressed: () {},
      ),
    );
  }
}
