import 'package:flutter/material.dart';
import 'sudoku_cell.dart';
import '../models/cell_position.dart';

class SudokuBlock extends StatelessWidget {
  final double boxSize;
  final int blockIndex;
  final int Function(int x, int y) getCellValue;
  final int Function(int x, int y) getExpectedValue;
  final CellPosition? selectedCell;
  final void Function(CellPosition position) onCellSelected;

  const SudokuBlock({
    super.key,
    required this.boxSize,
    required this.blockIndex,
    required this.getCellValue,
    required this.getExpectedValue,
    required this.selectedCell,
    required this.onCellSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (cellIndex) {
        final position = CellPosition(blockIndex, cellIndex);
        final value = getCellValue(blockIndex, cellIndex);
        final expectedValue = getExpectedValue(blockIndex, cellIndex);
        final isSelected = selectedCell == position;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          child: SudokuCell(
            value: value,
            expectedValue: expectedValue,
            isSelected: isSelected,
            onTap: () => onCellSelected(position),
          ),
        );
      }),
    );
  }
}
