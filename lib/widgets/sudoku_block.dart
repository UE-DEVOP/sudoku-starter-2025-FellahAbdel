import 'package:flutter/material.dart';
import 'sudoku_cell.dart';

class SudokuBlock extends StatelessWidget {
  final double boxSize;
  final int blockIndex;
  final int Function(int x, int y) getCellValue;

  const SudokuBlock({
    super.key,
    required this.boxSize,
    required this.blockIndex,
    required this.getCellValue,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (cellIndex) {
        final value = getCellValue(blockIndex, cellIndex);

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          child: SudokuCell(value: value),
        );
      }),
    );
  }
}
