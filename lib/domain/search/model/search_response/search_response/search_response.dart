import 'package:json_annotation/json_annotation.dart';
part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  int? page;
  List<SearchResults> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchResponse({
    this.page,
    this.results = const [],
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchResults {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  SearchResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return _$SearchResultsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultsToJson(this);
}
