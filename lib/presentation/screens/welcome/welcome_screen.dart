import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, Key? newKey});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    const Color customPurple = Color(0xFF6151A7);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.95),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  WelcomePage(
                    imagePath: 'lib/presentation/assets/images/octopos1.png',
                    title: "Welcome to OctoposPrime",
                    description:
                        'Master your skills with fun and learn\nfrom every fundamentals',
                  ),
                  WelcomePage(
                    imagePath: 'lib/presentation/assets/images/octopos2.png',
                    title: "Enhance Your Skills",
                    description:
                        'Gain new knowledge and skills with our comprehensive and interactive courses',
                  ),
                  WelcomePage(
                    imagePath: 'lib/presentation/assets/images/octopos3.png',
                    title: "Join Our Community",
                    description:
                        'Be part of a vibrant community of learners and experts. Share, collaborate, and grow together',
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 10.0,
                dotWidth: 10.0,
                expansionFactor: 3.0,
                spacing: 16.0,
                dotColor: Colors.grey,
                activeDotColor: customPurple,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: customPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: customPurple,
                      side: const BorderSide(color: customPurple),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:
                        const Text('Sign Up', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const WelcomePage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
