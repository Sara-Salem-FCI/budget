import 'package:budget/features/filter/data/models/filter_request_model.dart';

class SearchHistoryResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<SearchHistoryModel> searchHistory;

  SearchHistoryResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.searchHistory,
  });

  factory SearchHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryResponseModel(
      success: json['success'],
      statusCode: json['status_code'],
      message: json['message'],
      searchHistory: (json['data']['searchHistory'] as List)
          .map((item) => SearchHistoryModel.fromJson(item))
          .toList(),
    );
  }
}

class SearchHistoryModel {
  final int id;
  final String query;
  final FilterRequestModel? filters;

  SearchHistoryModel({
    required this.id,
    required this.query,
    this.filters,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryModel(
      id: json['id'],
      query: json['query'] ?? '',
      filters: json['filters'] != null ? FilterRequestModel.fromJson(json['filters']) : null,
    );
  }
}
