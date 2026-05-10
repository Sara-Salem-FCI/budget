import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'pagination_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaginationModel extends Equatable {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const PaginationModel({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);

  @override
  List<Object?> get props => [currentPage, lastPage, perPage, total];
}
