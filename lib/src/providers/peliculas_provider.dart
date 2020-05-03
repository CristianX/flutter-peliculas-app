
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

    return await _procesarRespuesta(url);

  }

  // Llamando peliculas populares
  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apikey,
      'languge' : _language
    });

  return await _procesarRespuesta(url);
    


}


// Metodo optimizado
Future <List<Pelicula>> _procesarRespuesta( Uri url ) async {
  // Llamado desde url
    final resp = await http.get(url);

    // Decodificando respuesta
    final decodeData = json.decode(resp.body);

    final peliculasPopulares = new Peliculas.fromJsonList(decodeData['results']);

    return peliculasPopulares.items;
  }
}
