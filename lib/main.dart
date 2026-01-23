import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/game_screen.dart';
import 'screens/end_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.game: (_) => const GameScreen(),
        AppRoutes.end: (_) => const EndScreen(),
      },
    );
  }
}
