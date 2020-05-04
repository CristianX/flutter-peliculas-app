import 'package:flutter/material.dart';

// Modelos
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  final Function siguientePagina;

  MovieHorizontal( { @required this.peliculas, @required this.siguientePagina } );

    // Listener para escuchar todo lo que suceda en el PageViewController
    final _pageController = PageController(
      initialPage: 1,
      // Cuantas tarjetas se muestran en cada vista (viewport)
      viewportFraction: 0.3,
    );

  @override
  Widget build(BuildContext context) {

    // Tomando medidas de la pantall
    final _screenSize = MediaQuery.of(context).size;

    // Ejecutando el listener _pageController
    _pageController.addListener(() {

      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ) {
        // print('Cargar siguientes pelicuas');
        siguientePagina();
      }

    });
    

    return Container(
      // Solo el 20% de la pantalla
      // * 0.2 para tomar el 20% de la pantalla
      height: _screenSize.height * 0.2,
      // PageWiew windget de flutter para deslizar como páginas
      // PageView.builder renderiza los elementos cuando son necesarios
      child: PageView.builder( 
        // Controlar deslizamiento
        pageSnapping: false,
        controller: _pageController,
        // children: _tarjetas( context )

        // Especificando items a renderizar en el itemBuilder
        itemCount: peliculas.length,
        itemBuilder: ( context, i ) => _tarjeta(context, peliculas[i])
      ),
    );
  }

  // Creando lista de peliculas en tarjetas
  // List<Widget> _tarjetas( BuildContext context ) {
  //   return peliculas.map(( pelicula ) {
  //     return Container(
  //       margin: EdgeInsets.only( right: 15.0 ),
  //       // Para que se desplace verticalmente si la pantalla es demasiado pequeña
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: <Widget>[
  //             ClipRRect(
  //               // Ezquinas
  //               borderRadius: BorderRadius.circular(20.0),
  //               child: FadeInImage(
  //                 image: NetworkImage(pelicula.getPosterImg()),
  //                 placeholder: AssetImage('assets/img/no-image.jpg'),
  //                 fit: BoxFit.cover,
  //                 height: 160.0,
  //               ),
  //             ),
  //             SizedBox( height: 4.0 ),
  //             Text(
  //               pelicula.title,
  //               // Coloca ... cuando el texto no cabe
  //               overflow: TextOverflow.ellipsis,
  //               style: Theme.of(context).textTheme.caption,
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   }).toList();
  // }



  // Tarjeta para pageview.builder
  Widget _tarjeta( BuildContext context, Pelicula pelicula ) {
    final peliculaTarjeta = Container(
        margin: EdgeInsets.only( right: 15.0 ),
        // Para que se desplace verticalmente si la pantalla es demasiado pequeña
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Implementación de Hero Animation
              Hero(
                // Se tiene que poner el mismo id único a donde va a llegar
                tag: pelicula.id,
                child: ClipRRect(
                  // Ezquinas
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                    height: 160.0,
                  ),
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

      // Generando el gesto de tap en las tarjetas del widget horizontal
      return GestureDetector(
        child: peliculaTarjeta,
        onTap: (){
          // print('Título de la película ${pelicula.title}');

          // Navegando a la ruta de detalle pelicula
          Navigator.pushNamed(context, 'detalle', arguments: pelicula);
        },
      );
  }

}