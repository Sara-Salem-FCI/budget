import 'package:equatable/equatable.dart';

class FilterOptionsModel extends Equatable {
  final List<FilterBrand> brands;
  final List<FilterFuelType> fuelTypes;
  final List<FilterTransmission> transmissions;
  final List<FilterColor> colors;
  final List<FilterStatus> statuses;

  const FilterOptionsModel({
    required this.brands,
    required this.fuelTypes,
    required this.transmissions,
    required this.colors,
    required this.statuses,
  });

  factory FilterOptionsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    return FilterOptionsModel(
      brands: (data['brands'] as List<dynamic>?)
              ?.map((e) => FilterBrand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fuelTypes: (data['fuel_types'] as List<dynamic>?)
              ?.map((e) => FilterFuelType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      transmissions: (data['transmissions'] as List<dynamic>?)
              ?.map((e) => FilterTransmission.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      colors: (data['colors'] as List<dynamic>?)
              ?.map((e) => FilterColor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      statuses: (data['statuses'] as List<dynamic>?)
              ?.map((e) => FilterStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [brands, fuelTypes, transmissions, colors, statuses];
}

class FilterBrand extends Equatable {
  final int id;
  final String name;

  const FilterBrand({required this.id, required this.name});

  factory FilterBrand.fromJson(Map<String, dynamic> json) {
    return FilterBrand(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['brands']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class FilterFuelType extends Equatable {
  final int id;
  final String name;

  const FilterFuelType({required this.id, required this.name});

  factory FilterFuelType.fromJson(Map<String, dynamic> json) {
    return FilterFuelType(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['fuel_type']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class FilterTransmission extends Equatable {
  final int id;
  final String name;

  const FilterTransmission({required this.id, required this.name});

  factory FilterTransmission.fromJson(Map<String, dynamic> json) {
    return FilterTransmission(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class FilterColor extends Equatable {
  final int id;
  final String name;

  const FilterColor({required this.id, required this.name});

  factory FilterColor.fromJson(Map<String, dynamic> json) {
    return FilterColor(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class FilterStatus extends Equatable {
  final int id;
  final String name;

  const FilterStatus({required this.id, required this.name});

  factory FilterStatus.fromJson(Map<String, dynamic> json) {
    return FilterStatus(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['type']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}
