import 'package:flutter/material.dart';
import 'package:planets/others/Planet.dart';
import 'package:planets/widgets/PlanetRow.dart';
import 'package:planets/widgets/PlanetSummary.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF736AB7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (context, index)=>PlanetSummary(planets[index]),
                  childCount: planets.length,
                ),
                itemExtent: 152,
              ),
            ),
          ],
        ),
      ),
    );
  }
}