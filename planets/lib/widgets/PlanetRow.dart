import 'package:flutter/material.dart';
import 'package:planets/others/Planet.dart';
import 'package:planets/others/textstyle.dart';

class PlanetRow extends StatelessWidget {

  final Planet planet;
  PlanetRow(this.planet);

  get planetCard => new Container(
    height: 124.0,
    margin: EdgeInsets.only(left: 46.0),
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
    margin: EdgeInsets.fromLTRB(100, 16, 16, 16),
    constraints: BoxConstraints.expand(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          children: <Widget>[
            Expanded(
              child: this._planetValue(
                value: this.planet.distance,
                image: "assets/img/ic_distance.png"
              )
            ),
            Expanded(
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
    alignment: FractionalOffset.centerLeft,
    child: Image(
      image: AssetImage(planet.image),
      height: 92.0,
      width: 92.0,
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
    return Container(
      height: 120,
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
    );
  }
}