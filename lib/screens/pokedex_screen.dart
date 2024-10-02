import 'package:flutter/material.dart';
import 'package:pokeflutter/components/app_bar_widget.dart';
import 'package:pokeflutter/components/pokedex/pokemon_list.dart';
import 'package:pokeflutter/constants.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(116.0),
        child: AppBarWidget(),
      ),
      body: SafeArea(
        child: PokemonList(),
      ),
    );
  }
}
