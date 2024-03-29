import 'package:flutter/material.dart';
import 'package:radio/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/'   : ( BuildContext context ) => HomePage()
      },
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
    );
  }
}