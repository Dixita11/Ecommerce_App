import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.productList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Trendify Logo with Myntra-style animation
            ZoomIn(
              duration: const Duration(seconds: 1),
              child: Bounce(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/trendify_logo.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Text animation
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  Text(
                    'TRENDIFY',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 10,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 2,
                    width: 60,
                    color: const Color(0xFF1A237E),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            /// Loading indicator
            FadeIn(
              delay: const Duration(milliseconds: 1200),
              child: const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1A237E)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
