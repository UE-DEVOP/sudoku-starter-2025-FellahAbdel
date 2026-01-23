import 'package:sudoku_api/sudoku_api.dart';

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

  int getSolutionValue(int row, int col) {
    if (_puzzle == null) return 0;

    return _puzzle!
        .solvedBoard()
        ?.matrix()?[row][col]
        .getValue() ?? 0;
  }

  bool get isLoaded => _puzzle != null;
}