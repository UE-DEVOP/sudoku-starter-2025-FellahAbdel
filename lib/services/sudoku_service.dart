import 'package:sudoku_api/sudoku_api.dart';

import '../models/cell_position.dart';

class SudokuService {
  Puzzle? _puzzle;

  Future<void> generatePuzzle({String patternName = "winter"}) async {
    PuzzleOptions puzzleOptions = PuzzleOptions(patternName: patternName);

    _puzzle = Puzzle(puzzleOptions);

    await _puzzle!.generate();
  }

  int getCellValue(int row, int col) {
    if (_puzzle == null) return 0;

    return _puzzle!
        .board()
        ?.matrix()?[row][col]
        .getValue() ?? 0;
  }

  void setCellValue(CellPosition position, int value) {
    if (_puzzle == null) return;

    // On utilise les coordonnées (x, y) ou (row, col) de ton objet CellPosition
    // pour accéder à la bonne case dans la matrice de la librairie.
    _puzzle!
        .board()
        ?.matrix()?[position.block][position.cell]
        .setValue(value);
  }

  int getSolutionValue(int row, int col) {
    if (_puzzle == null) return 0;

    return _puzzle!
        .solvedBoard()
        ?.matrix()?[row][col]
        .getValue() ?? 0;
  }

  bool get isLoaded => _puzzle != null;

  int getExpectedValue(int x, int y) {
    return _puzzle
        ?.solvedBoard()
        ?.matrix()?[x][y]
        .getValue() ??
        0;
  }

  bool isCorrectValue(int x, int y, int value) {
    final expected = _puzzle
        ?.solvedBoard()
        ?.matrix()?[x][y]
        .getValue();

    return expected == value;
  }


}