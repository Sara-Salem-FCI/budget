import 'package:flutter/material.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'car_card_horizontal.dart';
import 'car_card_grid.dart';
import 'car_card_list.dart';

enum CarCardStyle { horizontal, grid, list }

class CarCard extends StatelessWidget {
  final CarModel car;
  final CarCardStyle style;
  final double width;

  const CarCard({
    super.key,
    required this.car,
    this.style = CarCardStyle.horizontal,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case CarCardStyle.horizontal:
        return CarCardHorizontal(car: car, width: width);
      case CarCardStyle.grid:
        return CarCardGrid(car: car);
      case CarCardStyle.list:
        return CarCardList(car: car);
    }
  }
}
