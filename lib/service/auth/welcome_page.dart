import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pakeaja/view/pages/login_page.dart';
import 'package:pakeaja/view/pages/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        'Welcome to PakeAja',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.blue.shade300,
                        elevation: 5,
                        // Warna tombol lebih sesuai
                      ),
                      child: const Text('Register',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            childBuilder: (context) {
                              return const LoginPage();
                            },
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.blueAccent,
                          shadowColor: Colors.blue.shade300 // Warna teks tombol
                          ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
