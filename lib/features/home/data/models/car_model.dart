import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final int id;
  final String carImage;
  
  // Flattened from car_info
  final String name;
  final String brand;
  final int year;
  final String price;
  final String? location;
  
  // Flattened from discount
  final int discount;
  final bool hasDiscount;
  
  final bool isFav;
  final String createdAt;

  const CarModel({
    required this.id,
    required this.carImage,
    required this.name,
    required this.brand,
    required this.year,
    required this.price,
    this.location,
    required this.discount,
    required this.hasDiscount,
    required this.isFav,
    required this.createdAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    final info = json['car_info'] as Map<String, dynamic>? ?? {};
    final disc = json['discount'] as Map<String, dynamic>? ?? {};
    
    return CarModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      carImage: json['car_image']?.toString() ?? '',
      name: info['name']?.toString() ?? '',
      brand: info['brand']?.toString() ?? '',
      year: (info['year'] as num?)?.toInt() ?? 0,
      price: info['price']?.toString() ?? '',
      location: info['location']?.toString(),
      discount: (disc['discount'] as num?)?.toInt() ?? 0,
      hasDiscount: disc['has_discount'] as bool? ?? false,
      isFav: json['is_fav'] as bool? ?? false,
      createdAt: json['created_at']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'car_image': carImage,
    'car_info': {
      'name': name,
      'brand': brand,
      'year': year,
      'price': price,
      'location': location,
    },
    'discount': {
      'discount': discount,
      'has_discount': hasDiscount,
    },
    'is_fav': isFav,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props => [
        id,
        carImage,
        name,
        brand,
        year,
        price,
        location,
        discount,
        hasDiscount,
        isFav,
        createdAt
      ];
}
