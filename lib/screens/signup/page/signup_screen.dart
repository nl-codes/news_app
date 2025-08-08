import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/repo/auth_repo.dart';
import 'package:news_app/screens/login/page/login_screen.dart';
import 'package:news_app/states/bloc/auth_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            padding: EdgeInsets.all(30),
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
                  case Unauthenticated _:
                    setState(() {
                      isloading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please Sign up to continue!!!")),
                    );
                }
              },
              builder: (context, asyncSnapshot) {
                final authCubit = context.read<AuthCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        "Sign up to get started",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 30),
                    _InputField(
                      label: "Username",
                      controller: emailController,
                      errMsg: _emailErr,
                    ),
                    SizedBox(height: 14),
                    _InputField(
                      label: "Password",
                      controller: passwordController,
                      errMsg: _passErr,
                    ),
                    SizedBox(height: 14),
                    Row(
                      children: [
                        Icon(Icons.check_box, color: Colors.blueAccent),
                        Text("Remember me"),
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
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () => authCubit.signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                        child: Text("Sign up"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(child: Text("or continue with")),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton("Facebook"),
                        SizedBox(width: 20),
                        SocialButton("Google"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? errMsg;

  const _InputField({
    required this.controller,
    required this.errMsg,
    required this.label,
  });

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final isPassword = widget.label.toLowerCase() == 'password';

    return Column(
      children: [
        Row(
          children: [
            Text(widget.label),
            Text("*", style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: widget.label == "Password" ? _obscureText : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  )
                : null,
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
