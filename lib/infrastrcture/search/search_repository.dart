import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/endpoints.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response/search_response.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response/search_service.dart';

@LazySingleton(as: SearchService)
class SearchRepository implements SearchService {
  @override
  Future<Either<MainFailure, SearchResponse>> getSearchResults(
      {required String query}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': query});
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final SearchResponse searchResponse =
            SearchResponse.fromJson(response.data);
        log(searchResponse.toString());
        return Right(searchResponse);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
