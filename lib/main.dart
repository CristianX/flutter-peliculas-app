import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Páginas personalizadas 
import 'package:peliculas/src/pages/home_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Prevenir orientación de la pantalla
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
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