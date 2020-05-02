import 'package:flutter/material.dart';

// Swiper
import 'package:flutter_swiper/flutter_swiper.dart';

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
    return Container(
      // Swiper se lo debe encerrar en un container y especificar dimensiones ya que no renderiza
      // double.infinity usa todo el ancho posible de la página
      width: double.infinity,
      height: 300.0,
      padding: EdgeInsetsDirectional.only( top: 10.0 ),
      child: Swiper(
        // itemBuilder parecido al Future Builder
          itemBuilder: (BuildContext context,int index){
            // fit para que la imagen se adapte a las dimensiones que tiene
            return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
          },
          itemCount: 3,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),

          // Tipo de swipe
          layout: SwiperLayout.STACK,
          itemWidth: 200.0,
        ),
    );
  }
}