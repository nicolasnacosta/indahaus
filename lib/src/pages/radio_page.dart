import 'package:flutter/material.dart';
import 'package:radio/src/widget/player_widget.dart';

class RadioPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[

          _imagenFondo(),

          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black26,
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // SizedBox(height: 20.0),
              _titulos(),
              // SizedBox(height: 20.0),
              PlayerWidget( 
                // Episodio de indahaus
                // url: 'https://media.whooshkaa.com/show/3275/episode/343673.mp3?source=webplayer&url=https%3A%2F%2Fplayer.whooshkaa.com%2Fepisode%2F343673&instanceId=5c7da5e349501db045ac23dc30825050', 
                
                // Radio online
                url: 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p', 
              ),
            ],
          ),
          
        ],
      ),
      
    );
  }

  Widget _imagenFondo() {

    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.green,
      child: Image(
        image: AssetImage('assets/imagen-fondo.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _titulos() {

    return Column(
      children: <Widget>[
        Text(
          'INDAHAUS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            letterSpacing: 2.0
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'SENTITE EN CASA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            letterSpacing: 2.0
          ),
        ),
      ],
    );
  }

}