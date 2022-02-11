

class Movie{
  int? id;
  String? backdropPath;
  String? overview;
  String? releaseDate;
  String? posterPath;
  String? title;
  num? voteAverage;

  Movie({this.id, this.title, this.overview, this.posterPath, this.voteAverage, this.backdropPath, this.releaseDate});


  Movie.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'overview': overview,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'release_date': releaseDate,
    'vote_average': voteAverage,
  };

}


class MoviePopular{
  List<Movie>? results;
  MoviePopular({this.results});

  MoviePopular.fromJson(Map<String, dynamic> json){
    if(json['results'] != null){
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() =>{
    'results': results?.map((e) => e.toJson()).toList()
  };
}