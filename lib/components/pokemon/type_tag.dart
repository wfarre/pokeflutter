import 'package:flutter/material.dart';

class TypeTag extends StatelessWidget {
  const TypeTag({
    super.key,
    required this.pokemonData,
    required this.type,
  });

  final dynamic pokemonData;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: pokemonData.getTypeColor(type),
          borderRadius: BorderRadius.circular(16.0)),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      margin: const EdgeInsets.only(
        left: 16.0,
      ),
      child: Text(
        type,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
}
