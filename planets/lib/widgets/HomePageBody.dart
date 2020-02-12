import 'package:flutter/material.dart';
import 'package:planets/others/Planet.dart';
import 'package:planets/widgets/PlanetRow.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlanetRow(planets[0]);
  }
}