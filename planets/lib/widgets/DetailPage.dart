import 'package:flutter/material.dart';
import 'package:planets/others/Planet.dart';
import 'package:planets/others/textstyle.dart';
import 'package:planets/widgets/PlanetSummary.dart';
import 'package:planets/widgets/Separator.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;
  DetailPage(this.planet);

  Container _getBackground(){
    return new Container(
      child:Image.network(
        planet.picture, 
        fit: BoxFit.cover, 
        height: 300,
      ),
      constraints: BoxConstraints.expand(height:300),
    );
  }

  Container _getGradient(){
    return new Container(
      margin: EdgeInsets.only(top: 190),
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0x00736AB7),
            Color(0xFF736AB7),
          ],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent(){
    final _overviewTitle = "Overview".toUpperCase();
    return new ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummary(planet, horizontal: false,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_overviewTitle, style: headerTextStyle,),
              Separator(),
              Text(planet.description, style: commonTextStyle,)
            ],
          ),
        ),
      ],
    );
  }

  Container _getToolbar(BuildContext context){
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      ),
      child: BackButton(color: Colors.white,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: new Text("Planet Detail"),
      //  ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }
}

            // Hero(
            //   tag: "planet-hero-${planet.id}",
            //   child:Image.asset(
            //     planet.image, 
            //     width: 96, 
            //     height: 96,
            //   ),
            // ),