import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        // extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top section with icons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.star_border, color: Color(0xFF9B6CF0), size: 38),
                    Icon(
                      Icons.toggle_on_outlined,
                      color: Color(0xFF9B6CF0),
                      size: 38,
                    ),
                  ],
                ),
              ),

              // middle content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/graph_bar.png', // Replace with your graph image
                      height: 200,
                    ),
                    const SizedBox(height: 24),
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(text: 'Find way to\nmanage '),
                          TextSpan(
                            text: 'your \n',
                            style: TextStyle(color: Colors.purple),
                          ),
                          TextSpan(
                            text: 'finance',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'The most Transparent &\nSecurity Bank ever',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // bottom button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEA8BF3), Color(0xFF9B6CF0)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        context.go('/qr-code-scanner');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.withValues(alpha: 0.1),
                        ),
                        child: const Icon(LucideIcons.qrCode),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
