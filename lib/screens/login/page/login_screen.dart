import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/repo/auth_repo.dart';
import 'package:news_app/screens/bookmark/page/bookmark_screen.dart';
import 'package:news_app/screens/search/page/serach_by_author.dart';
import 'package:news_app/screens/signup/page/signup_screen.dart';
import 'package:news_app/states/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _emailErr = "";
  String? _passErr = "";
  bool isloading = false;

  void removeError() {
    setState(() {
      _emailErr = null;
      _passErr = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => AuthCubit(AuthRepository()),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  switch (state) {
                    case AuthError error:
                      setState(() {
                        isloading = false;
                        switch (error.type) {
                          case "email":
                            removeError();
                            _emailErr = error.message;

                          case "password":
                            removeError();
                            _passErr = error.message;

                          default:
                            removeError();
                        }
                      });

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(error.message)));

                    case AuthLoading _:
                      setState(() {
                        isloading = true;
                      });

                    case Authenticated state:
                      setState(() {
                        isloading = false;
                      });
                      removeError();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Welcome ${state.user.email}!")),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchByAuthorScreen(
                            userName: emailController.text.trim(),
                          ),
                        ),
                      );

                    case Unauthenticated _:
                      setState(() {
                        isloading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please Login to continue!!!")),
                      );
                  }
                },
                builder: (context, snapshot) {
                  final authCubit = context.read<AuthCubit>();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
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
                      InputField(
                        label: "Username",
                        controller: emailController,
                        errMsg: _emailErr,
                      ),
                      SizedBox(height: 14),
                      InputField(
                        label: "Password",
                        controller: passwordController,
                        errMsg: _passErr,
                      ),
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
                          onPressed: () => authCubit.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          ),
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
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookmarkScreen(),
                          ),
                        ),
                        child: Text(
                          "Go to bookmark",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? errMsg;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    required this.errMsg,
  });

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
          controller: controller,
          obscureText: label == "Password" ? true : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            errorText: errMsg,
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
