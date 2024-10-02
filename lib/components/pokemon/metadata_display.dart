import 'package:flutter/material.dart';
import 'package:pokeflutter/constants.dart';

class MetadataDisplay extends StatelessWidget {
  MetadataDisplay(
      {required this.infoType,
      this.icon,
      required this.data,
      required this.unit});

  final String infoType;
  final String data;
  final Icon? icon;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('$data $unit')],
          ),
          Text(infoType, style: TextStyle(color: kMediumGrey)),
        ],
      ),
    );
  }
}
