import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int value;

  const SudokuCell({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: value == 0
          ? const SizedBox.shrink()
          : Text(
        value.toString(),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
