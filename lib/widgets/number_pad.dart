import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final void Function(int value) onNumberSelected;

  const NumberPad({
    super.key,
    required this.onNumberSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final value = index + 1;
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(
                onPressed: () => onNumberSelected(value),
                child: Text(value.toString()),
              ),
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            final value = index + 6;
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(
                onPressed: () => onNumberSelected(value),
                child: Text(value.toString()),
              ),
            );
          }),
        ),
      ],
    );
  }
}
