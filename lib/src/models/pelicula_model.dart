// Generated by https://quicktype.io


class Peliculas {

  List<Pelicula> items = new List();

  Peliculas();

  // Para regresar todas las peliculas
  Peliculas.fromJsonList( List<dynamic> jsonList ) {
    
    if ( jsonList == null ) return;

    for( var item in jsonList ) {

      final pelicula = new Pelicula.fromJsonMap(item);
      items.add( pelicula );

    }

  }



}

class Pelicula {

  // Para implementación de Hero Animation
  String uniqueId;

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  // Se genera cuando viene una pelicula en json y lo convierte en map
  Pelicula.fromJsonMap( Map<String, dynamic> json ){
    popularity       = json['popularity'] / 1 ; // Para convertirlo en double
    voteCount        = json['vote_count'];
    video            = json['video'];
    posterPath       = json['poster_path'];
    id               = json['id'];
    adult            = json['adult'];
    backdropPath     = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle    = json['original_title'];
    genreIds         = json['genre_ids'].cast<int>();
    title            = json['title'];
    voteAverage      = json['vote_average'] / 1;
    overview         = json['overview'];
    releaseDate      = json['release_date'];
    
  }

// Retornando poster de pelicula
  getPosterImg() {

    if( posterPath == null ) {
      return 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.bmajestic.com.mx%2Fimages%2FDefault_Dress.jpg&f=1&nofb=1';
    } else {

      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

  }
  // Retornando backdroppath de la película
  getBackdropPath() {

    if( backdropPath == null ) {
      return 'https://www.bathroomcity.co.uk/sites/default/files/default_images/no_image_available_1.png';
    } else {

      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }

  }

















}
