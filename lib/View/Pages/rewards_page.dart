import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:dream_shopping/View/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool reward = false;
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 251, 249, 240),
      body: reward ? NoReward() : const RewardsBody(),
    );
  }
}

class NoReward extends StatelessWidget {
  const NoReward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.card_giftcard, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'No rewards yet',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Earn rewards by completing purchases.',
            style: TextStyle(color: Colors.black45, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class RewardsBody extends StatelessWidget {
  const RewardsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                'Login and order to earn points',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const RewardCard(
            points: 0,
            totalPoints: 150,
            title: "AirPod",
            imagePath: 'assets/airpod.png',
          ),
          const SizedBox(height: 20),
          const RewardCard(
            points: 0,
            totalPoints: 200,
            title: 'Vacuum Cleaner',
            imagePath: 'assets/airpod.png',
          ),
        ],
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final int points;
  final int totalPoints;
  final String title;
  final String imagePath;

  const RewardCard({
    super.key,
    required this.points,
    required this.totalPoints,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(
              imagePath,
              height: 150,
              width: 160,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$points/$totalPoints Points',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(title),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 35),
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.grey,
              ),
              child: const Text('Login to claim'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
