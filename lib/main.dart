import 'package:flutter/material.dart';

// Páginas personalizadas 
import 'package:peliculas/src/pages/home_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas App',
      initialRoute: '/',
      routes: {
        '/'  : ( BuildContext context ) => HomePage(),
      },
    );
  }
}