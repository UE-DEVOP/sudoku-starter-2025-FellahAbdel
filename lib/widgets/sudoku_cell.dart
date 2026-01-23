import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int value;
  final bool isSelected;
  final VoidCallback onTap;

  const SudokuCell({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blueAccent.shade100.withAlpha(100)
              : Colors.transparent,
        ),
        child: Center(
          child: value == 0
              ? const SizedBox.shrink()
              : Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
