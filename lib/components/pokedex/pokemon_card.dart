import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokeflutter/constants.dart';
import 'package:pokeflutter/main.dart';
import 'package:pokeflutter/screens/pokemon_screen.dart';
import 'package:pokeflutter/services/networking.dart';
import 'package:pokeflutter/utils.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard(
      {super.key,
      required this.name,
      required this.pokemonId,
      required this.image});

  final String name;
  final String pokemonId;
  final String image;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        NetworkHelper networkHelper =
            NetworkHelper('https://pokeapi.co/api/v2/pokemon');
        var pokemonData = await networkHelper.getPokemonData(widget.name);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PokemonScreen(
            pokemon: pokemonData,
          );
        }));
      },
      child: Container(
        height: 116.0,
        width: 112.0,
        padding: EdgeInsets.all(4.0),
        decoration: kCardBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.pokemonId,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 8.0),
            ),
            Image.network(
              widget.image,
              height: 72.0,
              width: 72.0,
            ),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
