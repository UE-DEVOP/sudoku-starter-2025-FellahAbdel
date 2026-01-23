import 'package:flutter/material.dart';
import 'sudoku_block.dart';
import '../models/cell_position.dart';

class SudokuGrid extends StatelessWidget {
  final double boxSize;
  final int Function(int x, int y) getCellValue;
  final CellPosition? selectedCell;
  final void Function(CellPosition position) onCellSelected;

  const SudokuGrid({
    super.key,
    required this.boxSize,
    required this.getCellValue,
    required this.selectedCell,
    required this.onCellSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxSize * 3,
      height: boxSize * 3,
      child: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(9, (blockIndex) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            child: SudokuBlock(
              boxSize: boxSize / 3,
              blockIndex: blockIndex,
              getCellValue: getCellValue,
              selectedCell: selectedCell,
              onCellSelected: onCellSelected,
            ),
          );
        }),
      ),
    );
  }
}
