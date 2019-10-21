import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';
import 'package:radio/src/pages/podcast_page.dart';
import 'package:radio/src/pages/radio_page.dart';
import 'package:radio/src/widget/player_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  IconData _iconPlay = Icons.play_arrow;
  final audioName = 'terraza.mp3';

  AudioPlayer audioPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Redio PIO', style: TextStyle(fontSize: 25),),
      //   centerTitle: true,
      // ),
      backgroundColor: Color.fromRGBO(31, 35, 47, 1.0),
      body: _callPage(currentIndex),
      // Container(
      //   padding: EdgeInsets.all(10.0),
      //   child: 
      //   Column(
      //     children: <Widget>[

      //       Text('Amo a banchero', style: TextStyle( fontSize: 20),),
      //       // SizedBox( height: 5.0,),

      //       Padding(
      //         padding: EdgeInsets.only( top: 5.0, bottom: 5.0 ),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20),
      //           child: Image(height: 100,
      //             image: AssetImage('assets/banchero.jpg'),
      //           ),
      //         ),
      //       ),
      //       _cardBotones(),
      //       // PlayerWidget( url: 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p', ),
      //       PlayerWidget( url: 'https://media.whooshkaa.com/show/3275/episode/343673.mp3?source=webplayer&url=https%3A%2F%2Fplayer.whooshkaa.com%2Fepisode%2F343673&instanceId=5c7da5e349501db045ac23dc30825050', ),

      //     ],
      //   ),
      // ),
      bottomNavigationBar: _crearNavigationBar(),
    );
  }

  Widget _callPage( int paginaActual ) {

    switch( paginaActual ) {

      case 0  : return RadioPage();
      case 1  : return PodcastPage();
      default : return RadioPage();

    }
  }

  Widget _cardBotones() {

    return Card(
      
      elevation: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _crearIconButton( _iconPlay, Colors.green, _playPause ),
          _crearIconButton( Icons.stop, Colors.red, _stop ),
        ],
      ),
    );
  }

  Widget _crearIconButton( IconData icon, Color color, VoidCallback onPressed ) {

    return IconButton(
      icon: Icon(icon),
      iconSize: 48,
      color: color,
      onPressed: onPressed
    );
  }

  void _playPause() {

    setState(() {
      if ( audioPlayer.state == AudioPlayerState.PLAYING ) {
        audioPlayer.pause();
        _iconPlay = Icons.play_arrow;
      } else {
        audioCache.play(audioName);
        _iconPlay = Icons.pause;
      }
    });
  }

  void _stop() {
    setState(() {
      if ( audioPlayer.state != AudioPlayerState.STOPPED ) {
        audioPlayer.stop();
        _iconPlay = Icons.play_arrow;
      }
    });
  }

  Widget _crearNavigationBar() {

    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(31, 35, 47, 1.0),
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.radio ),
          title: Text('Radio'),
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.playlist_play ),
          title: Text('Podcast'),
        ),
      ],
    );
  }
}