import 'package:flutter/material.dart';

class SudokuBlock extends StatelessWidget {
  final double boxSize;

  const SudokuBlock({
    super.key,
    required this.boxSize,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (index) {
        return Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.3,
            ),
          ),
        );
      }),
    );
  }
}
