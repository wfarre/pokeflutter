import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFDC0A2D);
const kLightGrey = Color(0xFFE0E0E0);
const kMediumGrey = Color(0xFF666666);

var kCardBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white,
        Color(0xFFEFEFEF),
      ],
    ),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
          color: Colors.black12,
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 3)),
    ]);

//POKEMON TYPE COLORS
const Color kBug = Color(0xFFA7B723);
const Color kDark = Color(0xFF75574C);
const Color kDragon = Color(0xFF7037FF);
const Color kElectric = Color(0xFFF9CF30);
const Color kFairy = Color(0xFFE69EAC);
const Color kFighting = Color(0xFFC12239);
const Color kFire = Color(0xFFF57D31);
const Color kFlying = Color(0xFFA891EC);
const Color kGhost = Color(0xFF70559B);
const Color kNormal = Color(0xFFAAA67F);
const Color kGrass = Color(0xFF74CB48);
const Color kGround = Color(0xFFDEC16B);
const Color kIce = Color(0xFF9AD6DF);
const Color kPoison = Color(0xFFA43E9E);
const Color kPsychic = Color(0xFFFB5584);
const Color kRock = Color(0xFFB69E31);
const Color kSteel = Color(0xFFB7B9D0);
const Color kWater = Color(0xFF6493EB);
