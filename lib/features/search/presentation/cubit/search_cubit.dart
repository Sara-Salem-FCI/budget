import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/features/home/data/repositories/home_repository.dart';
import 'package:budget/features/filter/data/repositories/filter_repository_impl.dart';
import 'package:budget/features/filter/data/models/filter_request_model.dart';
import 'package:budget/features/search/data/models/search_history_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepository _homeRepository;
  final FilterRepository _filterRepository;
  
  List<SearchHistoryModel> _recentSearches = [];

  SearchCubit(this._homeRepository, this._filterRepository) : super(SearchInitial());

  void loadInitialData() async {
    emit(SearchLoading());
    
    // Fetch suggested cars and search history in parallel or sequence
    final historyResult = await _filterRepository.getSearchHistory();
    final suggestionsResult = await _homeRepository.getSuggestedCars();

    historyResult.fold(
      (failure) => emit(SearchError(failure.message)),
      (historyResponse) {
        _recentSearches = historyResponse.searchHistory;
        suggestionsResult.fold(
          (failure) => emit(SearchError(failure.message)),
          (suggestionsResponse) => emit(SearchSuggestionsLoaded(
            recentSearches: List.from(_recentSearches),
            suggestedCars: suggestionsResponse.cars,
          )),
        );
      },
    );
  }

  void search(String query) async {
    if (query.isEmpty) {
      loadInitialData();
      return;
    }

    emit(SearchLoading());
    
    final result = await _homeRepository.searchCars(query: query);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (response) async {
        // Refresh history after search (assuming server saves it)
        await _refreshHistory();
        emit(SearchResultsLoaded(
          results: response.cars,
          recentSearches: List.from(_recentSearches),
        ));
      },
    );
  }

  void applyFilter(FilterRequestModel filter) async {
    emit(SearchLoading());
    
    final result = await _filterRepository.filterCars(filter);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (response) async {
        // Refresh history after search (assuming server saves it)
        await _refreshHistory();
        emit(SearchResultsLoaded(
          results: response.cars,
          recentSearches: List.from(_recentSearches),
        ));
      },
    );
  }

  void searchFromHistory(SearchHistoryModel history) async {
    emit(SearchLoading());
    
    final result = await _filterRepository.getSearchHistoryResults(history.id);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (response) => emit(SearchResultsLoaded(
        results: response.cars,
        recentSearches: List.from(_recentSearches),
      )),
    );
  }

  void removeRecentSearch(int id) async {
    // Optimistic UI update or just wait for API
    final result = await _filterRepository.deleteSearchHistory(id);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (_) {
        _recentSearches.removeWhere((item) => item.id == id);
        _refreshState();
      },
    );
  }

  Future<void> _refreshHistory() async {
    final result = await _filterRepository.getSearchHistory();
    result.fold(
      (_) => null, // Ignore error for background refresh
      (response) => _recentSearches = response.searchHistory,
    );
  }

  void _refreshState() {
    if (state is SearchSuggestionsLoaded) {
      final currentState = state as SearchSuggestionsLoaded;
      emit(SearchSuggestionsLoaded(
        recentSearches: List.from(_recentSearches),
        suggestedCars: currentState.suggestedCars,
      ));
    } else if (state is SearchResultsLoaded) {
      final currentState = state as SearchResultsLoaded;
      emit(SearchResultsLoaded(
        results: currentState.results,
        recentSearches: List.from(_recentSearches),
      ));
    }
  }
}
