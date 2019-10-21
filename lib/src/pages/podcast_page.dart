import 'package:flutter/material.dart';

class PodcastPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(36, 40, 52, 1.0),
        ),
        SafeArea(
          child: _crearTabla(context)
        ),
      ],
    );
  }

  Widget _crearTabla(BuildContext context) {

    return Table(
      children: [
        TableRow(
          children: [
            _crearItemTabla(context, 'La Manija 2!', '/2019/04/webp.net-resizeimage.png?w=768&h=768&crop=1'),
            _crearItemTabla(context, 'Aquelarre', '/2019/03/aquelarre-temporada-2-profile.png?w=768&h=768&crop=1'),
          ]
        ),
        TableRow(
          children: [
            _crearItemTabla(context, 'Al Paso!', '/2019/02/al-paso-podcast-logo.jpg?w=768&h=768&crop=1'),
            _crearItemTabla(context, 'La manija!', '/2018/10/la-manija-logo-redondo.png?w=768&h=768&crop=1'),
          ]
        ),
      ],
    );
  }

  Widget _crearItemTabla(BuildContext context, String nombre, String url) {

    final _screenSize = MediaQuery.of(context).size;
    print(_screenSize.width.toString());

    return Container(
        padding: EdgeInsets.all(12.0),
        height: (_screenSize.width / 2 ) + 40.0 ,
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage('https://indahauspod.files.wordpress.com$url'),
              placeholder: AssetImage('assets/loading.gif'),
            ),
            SizedBox(height: 10.0,),
            Text(nombre, style: TextStyle(color: Colors.white, fontSize: 20.0))
          ],
        ),
    ); 
  }
}