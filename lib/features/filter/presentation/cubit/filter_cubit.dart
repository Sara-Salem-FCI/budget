import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget/features/filter/data/repositories/filter_repository_impl.dart';
import 'package:budget/features/filter/data/models/filter_request_model.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final FilterRepository _repository;

  FilterCubit(this._repository) : super(const FilterState());

  void loadFilterOptions() async {
    emit(state.copyWith(status: FilterStatus.loading));
    
    final result = await _repository.getFilterOptions();
    
    result.fold(
      (failure) => emit(state.copyWith(
        status: FilterStatus.error,
        errorMessage: failure.message,
      )),
      (options) => emit(state.copyWith(
        status: FilterStatus.loaded,
        options: options,
      )),
    );
  }

  void updatePriceRange(int minPrice, int maxPrice) {
    emit(state.copyWith(
      request: state.request.copyWith(
        minPrice: minPrice,
        maxPrice: maxPrice,
      ),
    ));
  }

  void updateMileageRange(int minMileage, int maxMileage) {
    emit(state.copyWith(
      request: state.request.copyWith(
        minMileage: minMileage,
        maxMileage: maxMileage,
      ),
    ));
  }

  void toggleBrand(int brandId) {
    final currentBrands = List<int>.from(state.request.brandIds ?? []);
    if (currentBrands.contains(brandId)) {
      currentBrands.remove(brandId);
    } else {
      currentBrands.add(brandId);
    }
    emit(state.copyWith(
      request: state.request.copyWith(brandIds: currentBrands.isEmpty ? null : currentBrands),
    ));
  }

  void toggleFuelType(int fuelTypeId) {
    final currentFuelTypes = List<int>.from(state.request.fuelTypeIds ?? []);
    if (currentFuelTypes.contains(fuelTypeId)) {
      currentFuelTypes.remove(fuelTypeId);
    } else {
      currentFuelTypes.add(fuelTypeId);
    }
    emit(state.copyWith(
      request: state.request.copyWith(fuelTypeIds: currentFuelTypes.isEmpty ? null : currentFuelTypes),
    ));
  }

  void resetFilters() {
    emit(state.copyWith(request: const FilterRequestModel()));
  }
}
