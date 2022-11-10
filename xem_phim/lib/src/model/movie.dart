import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  int? voteCount;
  String? voteAverage;
  String? error;
  Movie({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.error,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdropPath': backdropPath,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'video': video,
      'voteCount': voteCount,
      'voteAverage': voteAverage,
      'error': error,
    };
  }

  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      return Movie();
    }

    return Movie(
        backdropPath: json['backdrop_path'].toString(),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteCount: json['vote_count'],
        voteAverage: json['vote_average'].toString());
  }
}
