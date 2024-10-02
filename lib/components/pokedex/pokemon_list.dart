import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokeflutter/components/pokedex/pokemon_card.dart';
import 'package:pokeflutter/models/pokemon.dart';
import 'package:pokeflutter/services/networking.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    super.key,
  });

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late List pokemons = [];

  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
    getPokemons(0);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var newItems = await getPokemons(pageKey);
      if (newItems != null) {
        final nextPageKey = pageKey + 21;
        _pagingController.appendPage(newItems, nextPageKey);
      } else {
        _pagingController.appendLastPage(newItems);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  NetworkHelper networkHelper =
      NetworkHelper("https://pokeapi.co/api/v2/pokemon");

  Future getPokemons(pageKey) async {
    int numberOfPokemonByPage = 21;
    var response =
        await networkHelper.getAllFinalPokemons(numberOfPokemonByPage, pageKey);

    if (response != null) {
      return response;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: PagedGridView<int, dynamic>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                itemBuilder: (context, item, index) => PokemonCard(
                  name: item.name,
                  pokemonId: item.id,
                  image: item.image,
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
