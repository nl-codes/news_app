import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/repo/auth_repo.dart';
import 'package:news_app/screens/login/page/login_screen.dart';
import 'package:news_app/screens/login/widget/input_field.dart';
import 'package:news_app/screens/login/widget/social_button.dart';
import 'package:news_app/states/bloc/auth_bloc.dart';
import 'package:news_app/widgets/custom_snackbar.dart';

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

                    showCustomSnackbar(context, error.message);

                  case AuthLoading _:
                    setState(() {
                      isloading = true;
                    });

                  case Authenticated state:
                    setState(() {
                      isloading = false;
                    });
                    removeError();
                    showCustomSnackbar(context, "Welcome ${state.user.email}!");
                  case Unauthenticated _:
                    setState(() {
                      isloading = false;
                    });
                    showCustomSnackbar(
                      context,
                      "Please Sign up to continue!!!",
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
