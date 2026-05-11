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
  
  // Details fields
  final String? transmission;
  final String? category;
  final String? engine;
  final String? fuelType;
  final String? mileage;
  final String? condition;
  final String? color;
  final String? showroomName;
  final String? installmentPrice;
  final String? description;
  
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
    this.transmission,
    this.category,
    this.engine,
    this.fuelType,
    this.mileage,
    this.condition,
    this.color,
    this.showroomName,
    this.installmentPrice,
    this.description,
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
      transmission: info['transmission']?.toString(),
      category: info['category']?.toString(),
      engine: info['engine']?.toString(),
      fuelType: info['fuel_type']?.toString(),
      mileage: info['mileage']?.toString(),
      condition: info['condition']?.toString(),
      color: info['color']?.toString(),
      showroomName: info['showroom_name']?.toString(),
      installmentPrice: info['installment_price']?.toString(),
      description: json['description']?.toString(),
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
      'transmission': transmission,
      'category': category,
      'engine': engine,
      'fuel_type': fuelType,
      'mileage': mileage,
      'condition': condition,
      'color': color,
      'showroom_name': showroomName,
      'installment_price': installmentPrice,
    },
    'description': description,
    'discount': {
      'discount': discount,
      'has_discount': hasDiscount,
    },
    'is_fav': isFav,
    'created_at': createdAt,
  };

  CarModel copyWith({
    int? id,
    String? carImage,
    String? name,
    String? brand,
    int? year,
    String? price,
    String? location,
    String? transmission,
    String? category,
    String? engine,
    String? fuelType,
    String? mileage,
    String? condition,
    String? color,
    String? showroomName,
    String? installmentPrice,
    String? description,
    int? discount,
    bool? hasDiscount,
    bool? isFav,
    String? createdAt,
  }) {
    return CarModel(
      id: id ?? this.id,
      carImage: carImage ?? this.carImage,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      year: year ?? this.year,
      price: price ?? this.price,
      location: location ?? this.location,
      transmission: transmission ?? this.transmission,
      category: category ?? this.category,
      engine: engine ?? this.engine,
      fuelType: fuelType ?? this.fuelType,
      mileage: mileage ?? this.mileage,
      condition: condition ?? this.condition,
      color: color ?? this.color,
      showroomName: showroomName ?? this.showroomName,
      installmentPrice: installmentPrice ?? this.installmentPrice,
      description: description ?? this.description,
      discount: discount ?? this.discount,
      hasDiscount: hasDiscount ?? this.hasDiscount,
      isFav: isFav ?? this.isFav,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        carImage,
        name,
        brand,
        year,
        price,
        location,
        transmission,
        category,
        engine,
        fuelType,
        mileage,
        condition,
        color,
        showroomName,
        installmentPrice,
        description,
        discount,
        hasDiscount,
        isFav,
        createdAt
      ];
}
