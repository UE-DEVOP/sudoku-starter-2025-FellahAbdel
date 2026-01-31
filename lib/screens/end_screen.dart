import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Victoire'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '🎉 Félicitations 🎉',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 20),
            const Text('Vous avez complété le Sudoku !'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.home,
                );
              },
              child: const Text('Retour à l’accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
