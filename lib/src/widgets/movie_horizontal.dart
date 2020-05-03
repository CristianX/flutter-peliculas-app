import 'package:flutter/material.dart';

// Modelos
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  MovieHorizontal( { @required this.peliculas } );


  @override
  Widget build(BuildContext context) {
    
    // Tomando medidas de la pantall
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      // Solo el 20% de la pantalla
      // * 0.2 para tomar el 20% de la pantalla
      height: _screenSize.height * 0.2,
      // PageWiew windget de flutter para deslizar como páginas
      child: PageView( 
        // Controlar deslizamiento
        pageSnapping: false,
        // Paginació
        controller: PageController(
          initialPage: 1,
          // Cuantas tarjetas se muestran en cada vista (viewport)
          viewportFraction: 0.3,
        ),
        children: _tarjetas( context ),
       ),
    );
  }

  // Creando lista de peliculas en tarjetas
  List<Widget> _tarjetas( BuildContext context ) {
    return peliculas.map(( pelicula ) {
      return Container(
        margin: EdgeInsets.only( right: 15.0 ),
        // Para que se desplace verticalmente si la pantalla es demasiado pequeña
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                // Ezquinas
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 160.0,
                ),
              ),
              SizedBox( height: 4.0 ),
              Text(
                pelicula.title,
                // Coloca ... cuando el texto no cabe
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      );
    }).toList();
  }
}