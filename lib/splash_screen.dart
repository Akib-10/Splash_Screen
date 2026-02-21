import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    // Start fade animation
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
      });
    });

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fluorescent_sharp,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                "My App",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text(
          "Home Page",
          style: TextStyle(
              color: Colors.blue
          ),
        )),
      ),
      body: const Center(
        child: Text(
          "Welcome to Home Screen!",
          style: TextStyle(
              fontSize: 22,
              color: Colors.blue
          ),
        ),
      ),
    );
  }
}
