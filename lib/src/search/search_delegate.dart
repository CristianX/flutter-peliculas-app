import 'package:flutter/material.dart';

// Modelo
import 'package:peliculas/src/models/pelicula_model.dart';

// Servicio
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';

  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan América',
  ];
  final peliculasRecientes = [
    'Spiderman',
    'Capitan América',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del appbar
    return [
      IconButton(
        icon: Icon( Icons.clear ), 
        onPressed: () {
          // Limpiar pantalla (query es todo lo que escribe el usuario, ya lo implementa flutter)
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        // Tiempo en el cual se anima el icono
        progress: transitionAnimation, 
      ), 
      onPressed: () {
        // Regresa a pantalla original
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que se muestran
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text( seleccion ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe

    if( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if( snapshot.hasData ) {

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map(( pelicula ){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'), 
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  close(context, null);
                  // Para corregir problema de Hero Animation
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList()
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    // // Operador ternario
    // final listaSugerida = ( query.isEmpty ) ? peliculasRecientes : peliculas.where( (p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    // return ListView.builder(
    //   itemCount: peliculasRecientes.length,
    //   itemBuilder: ( context, i ){
    //     return ListTile(
    //       leading: Icon(Icons.movie),
    //       title: Text(listaSugerida[i]),
    //       onTap: () {
    //         // Pasando a build results
    //         seleccion = listaSugerida[i];
    //         // Construyendo resultados
    //         showResults(context);
    //       },
    //     );
    //   }
    // );
  }


}