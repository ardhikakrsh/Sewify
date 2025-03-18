import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  final String title;
  const MyHero({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image(
            image: AssetImage('assets/img/login.jpg'),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              letterSpacing: 30,
            ),
          ),
        ),
      ],
    );
  }
}
