import 'package:flutter/material.dart';
import 'package:planets/others/Planet.dart';
import 'package:planets/others/textstyle.dart';
import 'package:planets/widgets/DetailPage.dart';

class PlanetSummary extends StatelessWidget {

  final Planet planet;
  final bool horizontal;
  PlanetSummary(this.planet, {this.horizontal = true});
  PlanetSummary.vertical(this.planet): horizontal = false;

  get planetCard => new Container(
    //child:  planetCardContent,
    height: horizontal ? 124.0 : 200,
    margin: horizontal
        ? new EdgeInsets.only(left: 46.0)
        : new EdgeInsets.only(top: 70.0),
    decoration: BoxDecoration(
      color: Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0)
        ),
      ],
    ),
  );

  get planetCardContent => Container(
    margin: EdgeInsets.fromLTRB(horizontal ? 100.0 : 16.0, horizontal ? 16.0 : 110.0, 16.0, 16.0),
    constraints: BoxConstraints.expand(),
    child: Column(
      crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 4,),
        Text(planet.name, style: headerTextStyle,),
        SizedBox(height: 8,),
        Text(planet.location, style: subHeaderTextStyle,),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 2.0,
          width: 18.0,
          color: Color(0xff00c6ff),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex:horizontal?1:0,
              child: this._planetValue(
                value: this.planet.distance,
                image: "assets/img/ic_distance.png"
              )
            ),
            SizedBox(width: horizontal? 8 :32,),
            Expanded(
              flex:horizontal?1:0,
              child: this._planetValue(
                value: this.planet.gravity,
                image: "assets/img/ic_gravity.png",
              )
            )
            
          ],
        ),
      ],
    ),
  );
  

  get planetThumbnail => Container(
    margin: EdgeInsets.symmetric(
      vertical: 16.0,
    ),
    alignment: horizontal? FractionalOffset.centerLeft: FractionalOffset.topCenter,
    child: Hero(
      tag: "planet-hero-${planet.id}",
      child:Image(
        image: AssetImage(planet.image),
        height: 92.0,
        width: 92.0,
      ),
    ),
  );


  Widget _planetValue({String value, String image}){
    return Row(
      children: <Widget>[
      Image.asset(image, height: 10,),
      SizedBox(width: 8,),
      Text(value, style: regularTextStyle,),
                ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(planet),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                new FadeTransition(opacity: animation, child: child),
              ) ,
            )
          : null,
      child: Container(
        height: 220,
        margin: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
            planetCardContent,
          ],
        ),
      )
    );
  }
}