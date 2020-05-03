import 'package:flutter/material.dart';

// Widget personalizado
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

// Servicios
import 'package:peliculas/src/providers/peliculas_provider.dart';

class HomePage extends StatelessWidget {



  final peliculasProvider = new PeliculasProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.blueGrey,
        // Acciones de la app bar
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.search ), 
            onPressed: () {}
          )
        ],
      ),

      // SafeArea wirget para respetar los notch o agujeros en pantalla
      // body: SafeArea(
      //   child: Text('Hola mundo!!!!')
      //   ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas()
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {


    peliculasProvider.getEnCines();

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        // Snapshot cuando se lo llama del Future tiene la data que retorna de peliculas
        if ( snapshot.hasData ){
          return CardSwiper( peliculas: snapshot.data );
        } else {
          // Se muestra unicamente cuando no se tiene informacion o cuando el future se está resolviendo
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }

      },
    );

    // Utilizando swiper de widgets personalizados
    // return CardSwiper( 
    //   peliculas: [1,2,3,4,5],
    //  );
  }
}