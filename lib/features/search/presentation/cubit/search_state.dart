import 'package:equatable/equatable.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/search/data/models/search_history_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResultsLoaded extends SearchState {
  final List<CarModel> results;
  final List<SearchHistoryModel> recentSearches;

  const SearchResultsLoaded({
    required this.results,
    required this.recentSearches,
  });

  @override
  List<Object?> get props => [results, recentSearches];
}

class SearchSuggestionsLoaded extends SearchState {
  final List<SearchHistoryModel> recentSearches;
  final List<CarModel> suggestedCars;

  const SearchSuggestionsLoaded({
    required this.recentSearches,
    required this.suggestedCars,
  });

  @override
  List<Object?> get props => [recentSearches, suggestedCars];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
