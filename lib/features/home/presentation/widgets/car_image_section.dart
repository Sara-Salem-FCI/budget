import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:budget/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/discount_ribbon.dart';
import 'package:budget/l10n/app_localizations.dart';

class CarImageSection extends StatefulWidget {
  final CarModel car;
  final double height;
  final double? borderRadius;

  const CarImageSection({
    super.key,
    required this.car,
    required this.height,
    this.borderRadius,
  });

  @override
  State<CarImageSection> createState() => _CarImageSectionState();
}

class _CarImageSectionState extends State<CarImageSection> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    _isFav = widget.car.isFav;
  }

  @override
  void didUpdateWidget(covariant CarImageSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.car.isFav != widget.car.isFav) {
      _isFav = widget.car.isFav;
    }
  }

  Future<void> _handleFavoriteTap() async {
    final token = await getIt<AuthLocalDataSource>().getToken();
    if (!mounted) return;

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.please_login),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isFav = !_isFav;
    });

    // ignore: use_build_context_synchronously
    context.read<FavoritesCubit>().toggleFavorite(widget.car);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(widget.borderRadius ?? 16),
          ),
          child: Image.network(
            widget.car.carImage,
            height: widget.height,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: widget.height,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.directions_car, size: 50, color: Colors.grey),
              );
            },
          ),
        ),
        if (widget.car.hasDiscount)
          DiscountRibbon(
            label: AppLocalizations.of(context)!.discount_label(widget.car.discount),
          ),
        Positioned(
          top: 10,
          left: 10,
          child: GestureDetector(
            onTap: _handleFavoriteTap,
            child: Icon(
              _isFav ? Icons.favorite : Icons.favorite_border,
              color: _isFav ? const Color(0xFF003DAB) : Colors.white,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }
}
