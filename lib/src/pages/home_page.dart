import 'package:flutter/material.dart';

// Widget personalizado
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
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
    // Utilizando swiper de widgets personalizados
    return CardSwiper( 
      peliculas: [1,2,3,4,5],
     );
  }
}