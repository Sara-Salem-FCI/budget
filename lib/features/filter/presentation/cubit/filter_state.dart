import 'package:equatable/equatable.dart';
import 'package:budget/features/filter/data/models/filter_options_model.dart';
import 'package:budget/features/filter/data/models/filter_request_model.dart';

enum FilterStatus { initial, loading, loaded, error }

class FilterState extends Equatable {
  final FilterStatus status;
  final FilterOptionsModel? options;
  final FilterRequestModel request;
  final String? errorMessage;

  const FilterState({
    this.status = FilterStatus.initial,
    this.options,
    this.request = const FilterRequestModel(),
    this.errorMessage,
  });

  FilterState copyWith({
    FilterStatus? status,
    FilterOptionsModel? options,
    FilterRequestModel? request,
    String? errorMessage,
  }) {
    return FilterState(
      status: status ?? this.status,
      options: options ?? this.options,
      request: request ?? this.request,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, options, request, errorMessage];
}
