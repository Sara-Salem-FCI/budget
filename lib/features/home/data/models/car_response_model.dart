import 'package:equatable/equatable.dart';
import 'car_model.dart';
import 'pagination_model.dart';

class CarResponseModel extends Equatable {
  final bool success;
  final int statusCode;
  final String message;
  final List<CarModel> cars;
  final PaginationModel pagination;

  const CarResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.cars,
    required this.pagination,
  });

  factory CarResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    final carsList = data['cars'] as List?;
    final paginationData = data['pagination'] as Map<String, dynamic>? ?? {};

    return CarResponseModel(
      success: json['success'] as bool? ?? false,
      statusCode: (json['status_code'] as num?)?.toInt() ?? 0,
      message: json['message']?.toString() ?? '',
      cars: carsList
              ?.whereType<Map<String, dynamic>>()
              .map((e) => CarModel.fromJson(e))
              .toList() ??
          [],
      pagination: PaginationModel.fromJson(paginationData),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'status_code': statusCode,
    'message': message,
    'data': {
      'cars': cars.map((e) => e.toJson()).toList(),
      'pagination': pagination.toJson(),
    },
  };

  @override
  List<Object?> get props => [success, statusCode, message, cars, pagination];
}
