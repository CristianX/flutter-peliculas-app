

class CastActores {
  List<Actor> actores = new List();

  CastActores.fromJsonList( List<dynamic> jsonList ) {

    if( jsonList == null ) return;

    jsonList.forEach( ( item ) {

      final actor = Actor.fromJsonMap(item);

      // agregando actor a lista de actores
      actores.add(actor);

    });

  }
}



class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap( Map<String, dynamic> json ) {
    castId      = json['cast_id'];
    character   = json['character'];
    creditId    = json['credit_id'];
    gender      = json['gender'];
    id          = json['id'];
    name        = json['name'];
    order       = json['order'];
    profilePath = json['profile_path'];
  }

  // Retornando imagen de actor
  getImagenActor() {

    if( profilePath == null ) {
      return 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn3.iconfinder.com%2Fdata%2Ficons%2Ficonset-1-1%2F24%2Ficon_set_outlinder-05-512.png&f=1&nofb=1';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }

  }
}
