import 'package:flutter/material.dart';
import 'package:pokeflutter/constants.dart';

class ColumnSeparator extends StatelessWidget {
  ColumnSeparator({super.key, required this.height});

  double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Container(width: 1, height: height, color: kLightGrey),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
