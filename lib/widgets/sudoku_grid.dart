import 'package:flutter/material.dart';

class SudokuGrid extends StatelessWidget {
  final double boxSize;

  const SudokuGrid({
    super.key,
    required this.boxSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxSize * 3,
      height: boxSize * 3,
      child: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(9, (index) {
          return Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
              ),
            ),
          );
        }),
      ),
    );
  }
}
