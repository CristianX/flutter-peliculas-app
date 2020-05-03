
import 'package:peliculas/src/certificate/certificate.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

// Paquete http
import 'package:http/http.dart' as http ;

// Importación para la decodificación del http
import 'dart:convert';

class PeliculasProvider {
  String _apikey =  Certificate().apiKey ;
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';


// Llamando peliculas en cines
Future<List<Pelicula>> getEnCines() async {

  final url = Uri.https(_url, '3/movie/now_playing', {
    'api_key' : _apikey,
    'language' : _language
  });

  // llamando desde url
  final resp =  await http.get( url );

  // Decodificando respuesta
  final decodeData = json.decode(resp.body);

  // print( decodeData['results'] );

  // fromJsonList se encarga de barrer cada uno de los resultados que se encuentran en esa lista y genera las pelicuas (clase creada en el model de pelicula)
  final peliculas = new Peliculas.fromJsonList(decodeData['results']);

  // print(peliculas.items[3].title);

  return peliculas.items;

}


}
