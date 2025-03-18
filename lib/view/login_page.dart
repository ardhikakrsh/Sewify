import 'package:flutter/material.dart';
import 'package:pakeaja/components/my_hero.dart';
import 'package:pakeaja/helper/diplay_message.dart';
import 'package:pakeaja/service/auth/auth_service.dart';
import 'package:pakeaja/view/home_page.dart';
import 'package:pakeaja/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const MyHero(title: 'Login'),
                    const SizedBox(height: 20.0),

                    // Email
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10.0),

                    // Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot password?',
                            style: TextStyle(color: Colors.blueAccent)),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20.0),

                    // Login Button
                    FilledButton(
                      onPressed: () {
                        onLoginPressed();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.blue.shade300,
                        elevation: 5,
                        minimumSize: const Size(double.infinity, 40.0),
                      ),
                      child: const Text('Login',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10.0),

                    // if dont have account\
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            ' Register here',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '© 2025 PakeAja. All rights reserved.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onLoginPressed() async {
    final authService = AuthService();

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      displayMessage('Email and password cannot be empty', context);
      return;
    }

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      displayMessage(e.toString(), context);
    }
  }
}
