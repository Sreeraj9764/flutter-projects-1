import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResponse>> getSearchResults(
      {required String query});
}
