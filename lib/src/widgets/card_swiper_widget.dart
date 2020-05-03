import 'package:flutter/material.dart';

// Swiper
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  // Recibir argumento
  final List<dynamic> peliculas;


  // Constructor @requiered para que el envió de esta constante sea obligatoria
  CardSwiper({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    // Cambiar dimensiones de tarjeta dependiendo las dimensiones de pantalla del dispositivo
    // MediaQuery da información de las dimensiones del dispositivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      // Swiper se lo debe encerrar en un container y especificar dimensiones ya que no renderiza
      // double.infinity usa todo el ancho posible de la página
      // width: double.infinity,
      padding: EdgeInsetsDirectional.only( top: 10.0 ),
      child: Swiper(
        // itemBuilder parecido al Future Builder
          itemBuilder: (BuildContext context,int index){
            // fit para que la imagen se adapte a las dimensiones que tiene
            // ClipRRect para redonddear bordes de la imagen
            return  ClipRRect( 
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover),
             );
             
          },
          itemCount: peliculas.length,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),

          // Tipo de swipe
          layout: SwiperLayout.STACK,

          // 0.7 es para definir el 70% del ancho
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
        ),
    );
  }
}