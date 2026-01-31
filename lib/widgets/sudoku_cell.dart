import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int value;
  final int expectedValue;
  final bool isSelected;
  final VoidCallback onTap;

  const SudokuCell({
    super.key,
    required this.value,
    required this.expectedValue,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value != 0 ? value : expectedValue;
    final isExpected = value == 0 && expectedValue != 0;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blueAccent.shade100.withAlpha(100)
              : Colors.transparent,
        ),
        child: Center(
          child: displayValue == 0
              ? const SizedBox.shrink()
              : Text(
            displayValue.toString(),
            style: TextStyle(
              fontSize: 20,
              color: isExpected ? Colors.black12 : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
