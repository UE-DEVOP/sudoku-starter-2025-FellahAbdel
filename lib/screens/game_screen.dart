import 'package:flutter/material.dart';
import '../widgets/sudoku_grid.dart';
import '../services/sudoku_service.dart';
import '../models/cell_position.dart';
import '../widgets/number_pad.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SudokuService _sudokuService = SudokuService();
  bool _isLoading = true;
  CellPosition? _selectedCell;

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

  void _onCellSelected(CellPosition position) {
    setState(() {
      _selectedCell = position;
    });
  }

  void _onNumberSelected(int value) {
    if (_selectedCell == null) return;

    setState(() {
      _sudokuService.setCellValue(_selectedCell!, value);
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
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SudokuGrid(
              boxSize: boxSize,
              getCellValue: _sudokuService.getCellValue,
              getExpectedValue: _sudokuService.getExpectedValue,
              selectedCell: _selectedCell,
              onCellSelected: _onCellSelected,
            ),
            const SizedBox(height: 20),
            NumberPad(onNumberSelected: _onNumberSelected),
          ],
        ),
      ),
    );
  }
}
