import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response/search_response.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response/search_service.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
/*idle*/

    on<Initialize>((event, emit) async {
      emit(state.copyWith(isError: false, isLoading: true));
      final Either<MainFailure, List<Downloads>> downloads =
          await _downloadService.getDownloadImages();
      emit(downloads.fold(
          (failure) => state.copyWith(
                isLoading: false,
                isError: true,
              ),
          (success) => state.copyWith(
              isLoading: false, isError: false, idleList: success)));
    });
    on<SearchMovie>((event, emit) async {
      emit(state.copyWith(isError: false, isLoading: true));
      final Either<MainFailure, SearchResponse> downloads =
          await _searchService.getSearchResults(query: event.query);
      emit(downloads.fold(
          (failure) => state.copyWith(
                isLoading: false,
                isError: true,
              ),
          (success) => state.copyWith(
              isLoading: false,
              isError: false,
              searchResult: success.results)));
    });
  }
}
