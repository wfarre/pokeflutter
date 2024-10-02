import 'package:flutter/material.dart';
import 'package:pokeflutter/components/column_separator.dart';
import 'package:pokeflutter/components/pokemon/label.dart';
import 'package:pokeflutter/components/pokemon/metadata_display.dart';
import 'package:pokeflutter/components/pokemon/stat_table.dart';
import 'package:pokeflutter/components/pokemon/type_tag.dart';
import 'package:pokeflutter/constants.dart';
import 'package:pokeflutter/services/networking.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key, required this.pokemon});

  final dynamic pokemon;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  NetworkHelper networkHelper =
      NetworkHelper("https://pokeapi.co/api/v2/pokemon");
  var pokemonData;
  late String pokemonImage;
  late Color pokemonPrimaryColor;

  @override
  void initState() {
    super.initState();
    getPokemonData(widget.pokemon);
  }

  void getPokemonData(dynamic pokemon) {
    setState(() {
      if (pokemon != null) {
        pokemonData = pokemon;
        pokemonPrimaryColor = pokemonData.getTypeColor(pokemonData.mainType);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(pokemonData.types);
    return Scaffold(
      backgroundColor: pokemonPrimaryColor,
      appBar: AppBar(
        backgroundColor: pokemonPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.pokemon.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(left: 4, right: 4, top: 200),
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0, top: 56.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemonData.types
                          .map<TypeTag>(
                            (type) =>
                                TypeTag(pokemonData: pokemonData, type: type),
                          )
                          .toList(),
                    ),
                    const ParagraphSpacing(),
                    Label(color: pokemonPrimaryColor, text: 'About'),
                    const ParagraphSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MetadataDisplay(
                          infoType: "weigth",
                          data: pokemonData.weight.toString(),
                          icon: Icon(Icons.monitor_weight),
                          unit: 'kg',
                        ),
                        ColumnSeparator(
                          height: 50.0,
                        ),
                        MetadataDisplay(
                            infoType: "heigth",
                            data: pokemonData.height.toString(),
                            icon: Icon(Icons.height),
                            unit: 'm'),
                        ColumnSeparator(
                          height: 50.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Column(
                                children: pokemonData.moves
                                    .map<Text>((move) => Text(move))
                                    .toList(),
                              ),
                              const Text(
                                'Moves',
                                style: TextStyle(color: kMediumGrey),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const ParagraphSpacing(),
                    const Text(
                        'adasdal;sdkl jskdlsajd djlkasjdl fhkfs f dsadl jsljdlalsd  jlkds d. sjdkals ksjdlk, sajdlk. sdjklajskdlj jskd'),
                    Label(color: pokemonPrimaryColor, text: "Base stats"),
                    const ParagraphSpacing(),
                    StatsTable(
                        pokemonPrimaryColor: pokemonPrimaryColor,
                        pokemonData: pokemonData)
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, 40.0),
                child: Image.network(
                  pokemonData.image,
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParagraphSpacing extends StatelessWidget {
  const ParagraphSpacing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16.0,
    );
  }
}
