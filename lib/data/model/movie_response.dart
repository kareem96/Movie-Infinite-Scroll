


class MovieResponse{
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResult;
  MovieResponse({
    this.page,
    this.totalPages,
    this.totalResult
  });

  MovieResponse.fromJson(Map<String, dynamic> json){
    page = json['page'];
    totalPages = json['total_pages'];
    totalResult = json['total_results'];
    if(json['results'] != null){
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
    'page':page,
    'total_pages':totalPages,
    'total_results':totalResult,
    'results': results?.map((v) => v.toJson()).toList(),
  };
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalTitle,
    this.originalLanguage,
    this.overview,
    this.posterPath,
    this.popularity,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
});

  Results.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() => {
    'adult':adult,
    'backdrop_path':backdropPath,
    'genre_ids':genreIds,
    'id':id,
    'original_title':originalTitle,
    'original_language':originalLanguage,
    'overview':overview,
    'poster_path':posterPath,
    'popularity':popularity,
    'release_date':releaseDate,
    'title':title,
    'video':video,
    'vote_count':voteCount,
    'vote_average':voteAverage,
  };
}