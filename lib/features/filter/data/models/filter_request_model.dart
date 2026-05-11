import 'package:equatable/equatable.dart';

class FilterRequestModel extends Equatable {
  final String? search;
  final int? minPrice;
  final int? maxPrice;
  final List<int>? brandIds;
  final List<int>? fuelTypeIds;
  final int? minMileage;
  final int? maxMileage;

  const FilterRequestModel({
    this.search,
    this.minPrice,
    this.maxPrice,
    this.brandIds,
    this.fuelTypeIds,
    this.minMileage,
    this.maxMileage,
  });
  
  factory FilterRequestModel.fromJson(Map<String, dynamic> json) {
    return FilterRequestModel(
      search: json['search'],
      minPrice: _toInt(json['min_price']),
      maxPrice: _toInt(json['max_price']),
      brandIds: _toIntList(json['brand_ids']),
      fuelTypeIds: _toIntList(json['fuel_type_ids']),
      minMileage: _toInt(json['min_mileage']),
      maxMileage: _toInt(json['max_mileage']),
    );
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  static List<int>? _toIntList(dynamic value) {
    if (value == null) return null;
    if (value is List) {
      return value.map((e) => _toInt(e)).whereType<int>().toList();
    }
    return null;
  }

  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> params = {};

    if (search != null && search!.isNotEmpty) params['search'] = search;
    if (minPrice != null) params['min_price'] = minPrice;
    if (maxPrice != null) params['max_price'] = maxPrice;
    
    // Dio handles arrays like this automatically if format is correctly set,
    // or you might need to structure it based on how Laravel expects it:
    if (brandIds != null && brandIds!.isNotEmpty) params['brand_ids[]'] = brandIds;
    if (fuelTypeIds != null && fuelTypeIds!.isNotEmpty) params['fuel_type_ids[]'] = fuelTypeIds;
    
    if (minMileage != null) params['min_mileage'] = minMileage;
    if (maxMileage != null) params['max_mileage'] = maxMileage;

    return params;
  }

  FilterRequestModel copyWith({
    String? search,
    int? minPrice,
    int? maxPrice,
    List<int>? brandIds,
    List<int>? fuelTypeIds,
    int? minMileage,
    int? maxMileage,
  }) {
    return FilterRequestModel(
      search: search ?? this.search,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      brandIds: brandIds ?? this.brandIds,
      fuelTypeIds: fuelTypeIds ?? this.fuelTypeIds,
      minMileage: minMileage ?? this.minMileage,
      maxMileage: maxMileage ?? this.maxMileage,
    );
  }

  @override
  List<Object?> get props => [
        search,
        minPrice,
        maxPrice,
        brandIds,
        fuelTypeIds,
        minMileage,
        maxMileage,
      ];
}
