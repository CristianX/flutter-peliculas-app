import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    // Para recivir parámetros de model.route
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar( pelicula ),
          // Widgets comunes y corrientes dentro de CustomScrollView
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0 ),
                _posterTitulo( context, pelicula ),
                _descripcion( pelicula ),
                _descripcion( pelicula ),
                _descripcion( pelicula ),
                _descripcion( pelicula ),
                _descripcion( pelicula ),
                _descripcion( pelicula ),
                _descripcion( pelicula ),
              ]
            )
          )
        ],
      )
    );
  }

  Widget _crearAppbar(Pelicula pelicula) {
    // SliverAppbar permite moverse conforme el scroll
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.blueGrey,
      expandedHeight: 200.0,
      floating: false,
      // Para que se mantenga visible al hacer el scroll
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white,  fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          image: NetworkImage( pelicula.getBackdropPath() ),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo( BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage( pelicula.getPosterImg() ),
              height: 150.0,
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              // Alineando texto a la izquierda
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon( Icons.star_border ),
                    Text( pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subhead )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}