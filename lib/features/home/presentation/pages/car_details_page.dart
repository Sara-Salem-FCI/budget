import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/home/data/models/car_model.dart';
import 'package:budget/features/home/presentation/widgets/car_details_item_row.dart';
import 'package:budget/features/home/presentation/widgets/car_details_quick_info.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  final CarModel car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  bool _showDetails = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final car = widget.car;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. Top Image Section
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  child: Icon(
                    car.isFav ? Icons.favorite : Icons.favorite_border,
                    color: car.isFav ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                car.carImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.directions_car, size: 100, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Content Section
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date and Name
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          car.createdAt.split('T').first,
                          style: AppStyles.caption.copyWith(fontSize: 14),
                        ),
                        Text(
                          car.name,
                          style: AppStyles.caption.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    // Price
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '${car.price} ${l10n.sar}',
                        style: AppStyles.heading1.copyWith(
                          color: const Color(0xFF003DAB),
                          fontSize: 32,
                        ),
                      ),
                    ),
                    
                    // Installment and Location
                    // Installment and Location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (car.installmentPrice != null) ...[
                          const Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.grey),
                          const SizedBox(width: 4),
                          Text(
                            l10n.installment_starts_from,
                            style: AppStyles.caption.copyWith(fontSize: 13),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${car.installmentPrice} ${l10n.sar}',
                            style: AppStyles.body2Bold.copyWith(color: AppColors.orange),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on_outlined, size: 18, color: AppColors.grey),
                        const SizedBox(width: 4),
                        Text(
                          car.location ?? l10n.riyadh,
                          style: AppStyles.caption.copyWith(fontSize: 14),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Quick Info Cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CarDetailsQuickInfo(
                          icon: Icons.directions_car_filled_outlined,
                          title: l10n.transmission,
                          value: car.transmission ?? l10n.automatic,
                        ),
                        CarDetailsQuickInfo(
                          icon: Icons.layers_outlined,
                          title: l10n.category_label,
                          value: car.category ?? l10n.standard,
                        ),
                        CarDetailsQuickInfo(
                          icon: Icons.verified_outlined,
                          title: l10n.year_label, 
                          value: car.year.toString(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Tabs (Details / Description)
                    Container(
                      height: 54,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _showDetails = false),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: !_showDetails ? AppColors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Text(
                                  l10n.description_tab,
                                  style: AppStyles.body2Bold.copyWith(
                                    color: !_showDetails ? AppColors.primary : AppColors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _showDetails = true),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _showDetails ? AppColors.primary : Colors.transparent,
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Text(
                                  l10n.details_tab,
                                  style: AppStyles.body2Bold.copyWith(
                                    color: _showDetails ? Colors.white : AppColors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Conditional Content
                    if (_showDetails) ...[
                      CarDetailsItemRow(title: l10n.brand, value: car.brand),
                      CarDetailsItemRow(title: l10n.model, value: car.name), // Using name as model if no specific model field
                      CarDetailsItemRow(title: l10n.engine_label, value: car.engine ?? '2.0 L'),
                      CarDetailsItemRow(title: l10n.fuel_type, value: car.fuelType ?? l10n.gasoline_fuel),
                      CarDetailsItemRow(title: l10n.car_mileage_label, value: car.mileage ?? '16,000 ${l10n.km}'),
                      CarDetailsItemRow(title: l10n.car_condition_label, value: car.condition ?? l10n.used_condition),
                      CarDetailsItemRow(title: l10n.color_label, value: car.color ?? l10n.black_color),
                      CarDetailsItemRow(
                        title: l10n.showroom_name_label, 
                        value: car.showroomName ?? 'بدجت الرياض',
                        showDivider: false,
                      ),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          car.description ?? l10n.no_results, // Fallback to localized 'no results' if no description
                          style: AppStyles.body1,
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Map Section
                    Text(
                      l10n.location_on_map,
                      style: AppStyles.heading2.copyWith(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          image: const DecorationImage(
                            image: NetworkImage('https://static-maps.yandex.ru/1.x/?lang=en_US&ll=46.6753,24.7136&z=12&l=map&size=600,300'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.location_on, color: Colors.red, size: 40),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100), // Space for bottom bar
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 54,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF003DAB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l10n.send_inquiry_button,
                    style: AppStyles.body2Bold.copyWith(color: const Color(0xFF003DAB)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003DAB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l10n.call_button,
                    style: AppStyles.body2Bold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
