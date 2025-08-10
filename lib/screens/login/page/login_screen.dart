import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/screens/login/widget/custom_checkbox.dart';
import 'package:news_app/screens/login/widget/input_field.dart';
import 'package:news_app/screens/login/widget/social_button.dart';
import 'package:news_app/states/bloc/auth_bloc.dart';
import 'package:news_app/widgets/custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var box = Hive.box("Flutter");
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

                    showCustomSnackbar(context, "Invalid Credentials");

                  case AuthLoading _:
                    setState(() {
                      isloading = true;
                    });

                  case Authenticated state:
                    String? username = box.get('username');
                    box.put('username', username ?? "hehehehe");

                    setState(() {
                      isloading = false;
                    });
                    removeError();
                    showCustomSnackbar(
                      context,
                      "Logged in as ${state.user.email}",
                    );

                    Navigator.pushNamed(context, '/home');

                  case Unauthenticated _:
                    setState(() {
                      isloading = false;
                    });
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
                        Row(children: [CustomCheckbox(), Text("Remember me")]),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/forgot-password'),
                          child: Text(
                            "Forgot the password ?",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
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
                          onTap: () => Navigator.pushNamed(context, '/signup'),
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
