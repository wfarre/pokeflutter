import 'package:flutter/material.dart';
import 'package:pokeflutter/components/column_separator.dart';
import 'package:pokeflutter/components/pokemon/label.dart';
import 'package:pokeflutter/components/pokemon/stat_progress_bar.dart';

const statsLabel = ['HP', 'ATK', 'DEF', 'SATK', 'SDEF', 'SPD'];

class StatsTable extends StatelessWidget {
  const StatsTable({
    super.key,
    required this.pokemonPrimaryColor,
    required this.pokemonData,
  });

  final Color pokemonPrimaryColor;
  final dynamic pokemonData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: statsLabel
              .map((label) => Label(text: label, color: pokemonPrimaryColor))
              .toList(),
        ),
        ColumnSeparator(
          height: 140,
        ),
        Expanded(
          child: Container(
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: pokemonData
                  .stats()
                  .map<StatProgressBar>(
                    (stat) => StatProgressBar(
                      stat: stat,
                      darkColor: pokemonPrimaryColor,
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
