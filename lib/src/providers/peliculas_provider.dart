
// Certificado
import 'package:peliculas/src/certificate/certificate.dart';

// Modelos
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

// Stream Controller
import 'dart:async';

// Paquete http
import 'package:http/http.dart' as http ;

// Importación para la decodificación del http
import 'dart:convert';

class PeliculasProvider {
  String _apikey =  Certificate().apiKey ;
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  
  // Página de populares
  int _popularesPage = 0;

  bool _cargando = false;

  // Corriente de datos
  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  // Insertar información al stream
  Function( List<Pelicula> ) get popularesSink => _popularesStreamController.sink.add;

  // Escuchar todo lo que el stream emite
  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  // Para cerrar peticiones
  void disposeStreams() {
    _popularesStreamController?.close();
  }


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

      // Evitando peticiones http múltiples
      if( _cargando ) return [];
      _cargando = true;
      
      _popularesPage++;

      // print('Cargando siguientes $_popularesPage');

      final url = Uri.https(_url, '3/movie/popular', {
        'api_key' : _apikey,
        'language' : _language,
        'page'    : _popularesPage.toString()
      });


      // Enviando al stream
      final resp = await _procesarRespuesta(url);
      _populares.addAll(resp);
      popularesSink( _populares );

      // Cerrando petición
      _cargando = false;

      return resp;
      


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


  // Actores
  Future<List<Actor>> getCastActores(String peliId ) async {

    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key' : _apikey,
      'language' : _language
    });

    final resp = await http.get(url);
    
    // Decodificando data para transformarlo a mapa
    final decodedData = json.decode(resp.body);

    final castActores = new CastActores.fromJsonList(decodedData['cast']);

    return castActores.actores;

  }


}
