import 'package:flutter/material.dart';
import '../widgets/sudoku_grid.dart';
import '../services/sudoku_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SudokuService _sudokuService = SudokuService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  Future<void> _initGame() async {
    await _sudokuService.generatePuzzle();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    final width = MediaQuery.of(context).size.width;
    final maxSize = height > width ? width : height;
    final boxSize = (maxSize / 3).ceil().toDouble();

    return Scaffold(
      appBar: AppBar(title: const Text('Sudoku')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : SudokuGrid(
          boxSize: boxSize,
          getCellValue: _sudokuService.getCellValue,
        ),
      ),
    );
  }
}
