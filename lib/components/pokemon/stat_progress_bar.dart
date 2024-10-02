import 'package:flutter/material.dart';

class StatProgressBar extends StatelessWidget {
  const StatProgressBar(
      {super.key, required this.stat, required this.darkColor});

  final int stat;
  final Color darkColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 32,
          child: Text(stat.toString()),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Container(
            width: 200,
            height: 5,
            color: Colors.blue.shade100,
            child: Transform.scale(
              scaleX: stat / 200,
              origin: Offset(-125, 0),
              child: Container(
                height: double.infinity,
                color: darkColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
