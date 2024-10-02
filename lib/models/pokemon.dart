import 'package:flutter/material.dart';
import 'package:pokeflutter/constants.dart';
import 'package:pokeflutter/utils.dart';

class Pokemon {
  Pokemon(
      {required this.description,
      this.weight,
      this.height,
      required this.moves,
      this.hp,
      this.atk,
      this.def,
      this.satk,
      this.sdef,
      this.speed,
      required this.name,
      this.image,
      this.id,
      required this.mainType,
      required this.types});

  final String name;
  final String? image;
  final String? id;
  final String mainType;
  final String description;
  final int? weight;
  final int? height;
  final int? hp;
  final int? atk;
  final int? def;
  final int? satk;
  final int? sdef;
  final int? speed;
  final List moves;
  final List types;

  // String? id() {
  //   if (id != null) return formatPokemonId(id!);
  // }

  factory Pokemon.fromJson(dynamic json) {
    String? jsonImage =
        json['sprites']?['other']['official-artwork']['front_default'];
    String jsonId = formatPokemonId(json?['id']);
    List types = json['types'].map((type) {
      return type['type']['name'];
    }).toList();

    List moves = json['abilities'].map((move) {
      return move['ability']['name'];
    }).toList();

    return Pokemon(
      name: json['name'],
      image: jsonImage,
      id: jsonId,
      mainType: json['types'][0]['type']['name'],
      types: types,
      description: '',
      weight: json['weight'],
      height: json['height'],
      hp: json['stats'][0]['base_stat'],
      atk: json['stats'][1]['base_stat'],
      def: json['stats'][2]['base_stat'],
      satk: json['stats'][3]['base_stat'],
      sdef: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
      moves: moves,
    );
  }

  Color getTypeColor(String type) {
    switch (type) {
      case "grass":
        return kGrass;
      case "water":
        return kWater;
      case "fire":
        return kFire;
      case "bug":
        return kBug;
      case "electric":
        return kElectric;
      case "ghost":
        return kGhost;
      case "normal":
        return kNormal;
      case "psychic":
        return kPsychic;
      case "rock":
        return kRock;
      case "dark":
        return kDark;
      case "dragon":
        return kDragon;
      case "fairy":
        return kFairy;
      case "fighting":
        return kFighting;
      case "ground":
        return kGround;
      case "ice":
        return kIce;
      case "poison":
        return kPoison;
      case "flying":
        return kFlying;
      case "steel":
        return kSteel;
      default:
        return kNormal;
    }
  }

  List stats() {
    return [hp, atk, def, satk, sdef, speed].toList();
  }

  // Color typeColor() {
  //   return getTypeColor(type);
  // }
}
