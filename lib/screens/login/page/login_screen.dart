import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(
                'Again!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  "Welcome back you've been missed",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 30),
              InputField("Username"),
              SizedBox(height: 14),
              InputField("Password"),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_box, color: Colors.blueAccent),
                      Text("Remember me"),
                    ],
                  ),
                  Text(
                    "Forgot the password ?",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("Login"),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text("or continue with"),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SocialButton("Facebook"),
                  SizedBox(width: 20),
                  SocialButton("Google"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 40),
                  Text("don't have an account ?"),
                  SizedBox(width: 4),
                  Text("Sign Up", style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;

  const InputField(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    final isPassword = label.toLowerCase() == 'password';

    return Column(
      children: [
        Row(
          children: [
            Text(label),
            Text("*", style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: isPassword ? Icon(Icons.visibility_off_outlined) : null,
          ),
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final String platform;
  const SocialButton(this.platform, {super.key});

  @override
  Widget build(BuildContext context) {
    final isFacebook = platform.toLowerCase() == 'facebook';
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white70,
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        children: [
          isFacebook
              ? Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png',
                  height: 25,
                  width: 25,
                )
              : Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/250px-Google_Favicon_2025.svg.png',
                  height: 25,
                  width: 25,
                ),
          SizedBox(width: 10),
          Text(
            platform,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
